document.addEventListener('DOMContentLoaded', () => {
  const API = {
    books: '/api/getBooks',
    addBooks: '/api/addBook',
    deleteBooks: '/api/delBook/',
    count: '/api/count',
    bookings: '/api/getBookingDetails',
    makeBooking: '/api/makeBooking',
    cancel: '/api/cancelBooking'
  };

  const state = {
    mode: 'browse',
    books: [],
    bookings: [],
    newBooks: [blankBook()],
    selectedIsbns: [],
    count: 0,
    statusMessage: '',
    statusType: 'info',
    bookPage: 1,
    bookingPage: 1,
    pageSize: 6
  };

  const contentEl = document.getElementById('content');
  const statusRow = document.getElementById('status-row');
  const statusBox = document.getElementById('status-box');
  const modeSwitcher = document.getElementById('mode-switcher');

  function blankBook() {
    return { isbn: '', title: '', cover: '', publisher: '', pages: '', available: '' };
  }

  function setStatus(message, type = 'info') {
    state.statusMessage = message;
    state.statusType = type;
    if (!message) {
      statusRow.style.display = 'none';
      return;
    }
    statusBox.className = `alert ${type === 'success' ? 'success' : type === 'danger' ? 'danger' : 'info'}`;
    statusBox.textContent = message;
    statusRow.style.display = 'flex';
  }

  function invalidBook(book) {
    const isbn = (book.isbn || '').trim();
    const title = (book.title || '').trim();
    const pages = parseInt(book.pages, 10);
    const available = parseInt(book.available, 10);
    return !(isbn.length >= 5 && title.length >= 3 && Number.isFinite(pages) && pages > 0 && Number.isFinite(available) && available >= 0);
  }

  async function loadBooks() {
    try {
      const res = await fetch(API.books);
      if (!res.ok) throw new Error('Could not load books.');
      state.books = await res.json();
      state.bookPage = 1;
    } catch (e) {
      setStatus(e.message, 'danger');
    }
  }

  async function loadBookings() {
    try {
      const res = await fetch(API.bookings);
      if (!res.ok) throw new Error('Could not load bookings.');
      state.bookings = await res.json();
      state.bookingPage = 1;
    } catch (e) {
      setStatus(e.message, 'danger');
    }
  }

  async function fetchCount() {
    try {
      const res = await fetch(API.count);
      if (!res.ok) throw new Error('Could not load count.');
      state.count = await res.json();
    } catch (e) {
      setStatus(e.message, 'danger');
    }
  }

  function render() {
    setStatus(state.statusMessage, state.statusType);
    if (state.mode === 'browse') {
      contentEl.innerHTML = renderBrowse();
    } else if (state.mode === 'add') {
      contentEl.innerHTML = renderAdd();
    } else if (state.mode === 'count') {
      contentEl.innerHTML = renderCount();
    } else if (state.mode === 'delete') {
      contentEl.innerHTML = renderDelete();
    } else if (state.mode === 'borrow') {
      contentEl.innerHTML = renderBorrow();
    } else if (state.mode === 'cancel') {
      contentEl.innerHTML = renderCancel();
    }
  }

  function paginated(items, page, pageSize) {
    const totalPages = Math.max(1, Math.ceil(items.length / pageSize));
    const safePage = Math.min(Math.max(1, page), totalPages);
    const start = (safePage - 1) * pageSize;
    return {
      page: safePage,
      totalPages,
      slice: items.slice(start, start + pageSize)
    };
  }

  function renderPager(current, total, target) {
    if (total <= 1) return '';
    const prevDisabled = current <= 1 ? 'disabled' : '';
    const nextDisabled = current >= total ? 'disabled' : '';
    return `
      <div class="paginator">
        <button class="btn-ghost" data-action="page" data-target="${target}" data-page="prev" ${prevDisabled}>Prev</button>
        <span class="muted">Page ${current} of ${total}</span>
        <button class="btn-ghost" data-action="page" data-target="${target}" data-page="next" ${nextDisabled}>Next</button>
      </div>
    `;
  }

  function renderBrowse() {
    if (!state.books.length) return `<section class="card"><p class="muted">No books found.</p></section>`;
    const paged = paginated(state.books, state.bookPage, state.pageSize);
    const rows = paged.slice.map(b => `
      <tr>
        <td>${escapeHtml(b.isbn)}</td>
        <td>${escapeHtml(b.title)}</td>
        <td>${escapeHtml(b.cover || '')}</td>
        <td>${escapeHtml(b.publisher || '')}</td>
        <td>${b.pages}</td>
        <td>${b.available}</td>
      </tr>`).join('');
    return `
    <section class="card">
      <div class="card-head">
        <div>
          <p class="eyebrow">Catalogue</p>
          <h3>Available titles</h3>
        </div>
        <div class="chip chip-neutral">Sorted by ISBN</div>
      </div>
      <table class="data-table">
        <thead>
          <tr><th>Book code</th><th>Title</th><th>Cover</th><th>Publisher</th><th>Pages</th><th>Available</th></tr>
        </thead>
        <tbody>${rows}</tbody>
      </table>
      ${renderPager(paged.page, paged.totalPages, 'books')}
    </section>`;
  }

  function renderAdd() {
    const rows = state.newBooks.map((b, idx) => `
      <div class="stacked-form repeatable" data-idx="${idx}">
        <div class="two-col">
          <label>ISBN
            <input type="text" data-field="isbn" value="${escapeAttr(b.isbn)}" placeholder="978-..." required>
          </label>
          <label>Title
            <input type="text" data-field="title" value="${escapeAttr(b.title)}" placeholder="Title" required>
          </label>
        </div>
        <div class="two-col">
          <label>Cover
            <input type="text" data-field="cover" value="${escapeAttr(b.cover)}" placeholder="Hardcover / Paperback">
          </label>
          <label>Publisher
            <input type="text" data-field="publisher" value="${escapeAttr(b.publisher)}" placeholder="Publisher">
          </label>
        </div>
        <div class="two-col">
          <label>Pages
            <input type="number" data-field="pages" value="${escapeAttr(b.pages)}" min="1" placeholder="268" required>
          </label>
          <label>Available copies
            <input type="number" data-field="available" value="${escapeAttr(b.available)}" min="0" placeholder="4" required>
          </label>
        </div>
        ${invalidBook(b) ? `<div class="field-error">Fill ISBN (>=5 chars), Title (>=3 chars), Pages (>0) and Available (>=0).</div>` : ''}
      </div>
    `).join('');
    return `
    <section class="card">
      <div class="card-head">
        <div>
          <p class="eyebrow">Add books</p>
          <h3>Stage new titles</h3>
        </div>
        <div class="chip chip-neutral">Bulk friendly</div>
      </div>
      <form id="add-books-form">
        ${rows}
        <div class="button-row">
          <button class="btn-ghost" type="button" data-action="add-row">Add row</button>
          <button class="btn-ghost" type="button" data-action="remove-row">Remove row</button>
          <button class="btn-primary" type="button" data-action="submit-books">Submit to catalogue</button>
        </div>
      </form>
    </section>`;
  }

  function renderCount() {
    return `
    <section class="card spotlight">
      <div class="card-head">
        <div>
          <p class="eyebrow">Inventory health</p>
          <h3>Total books tracked</h3>
        </div>
        <div class="chip chip-neutral">Live</div>
      </div>
      <div class="big-number">${state.count}</div>
      <p class="muted">This number includes every title currently stored in the catalogue.</p>
    </section>`;
  }

  function renderDelete() {
    const paged = paginated(state.books, state.bookPage, state.pageSize);
    const rows = paged.slice.map(b => `
      <tr>
        <td><input type="checkbox" data-isbn="${escapeAttr(b.isbn)}" ${state.selectedIsbns.includes(b.isbn) ? 'checked' : ''}></td>
        <td>${escapeHtml(b.isbn)}</td>
        <td>${escapeHtml(b.title)}</td>
        <td>${escapeHtml(b.cover || '')}</td>
        <td>${escapeHtml(b.publisher || '')}</td>
        <td>${b.pages}</td>
        <td>${b.available}</td>
      </tr>`).join('');
    return `
    <section class="card">
      <div class="card-head">
        <div>
          <p class="eyebrow">Clean up</p>
          <h3>Pick books to delete</h3>
        </div>
        <div class="chip chip-warning">Bulk delete</div>
      </div>
      <table class="data-table">
        <thead><tr><th>Pick</th><th>Book code</th><th>Title</th><th>Cover</th><th>Publisher</th><th>Pages</th><th>Available</th></tr></thead>
        <tbody>${rows}</tbody>
      </table>
      <div class="button-row">
        <button class="btn-danger" type="button" data-action="delete-selected">Delete selected</button>
      </div>
      ${renderPager(paged.page, paged.totalPages, 'books')}
    </section>`;
  }

  function renderBorrow() {
    const paged = paginated(state.books, state.bookPage, state.pageSize);
    const cards = paged.slice.map(b => `
      <article class="book-card">
        <p class="eyebrow">${escapeHtml(b.publisher || '')}</p>
        <h4>${escapeHtml(b.title)}</h4>
        <p class="muted">ISBN: ${escapeHtml(b.isbn)}</p>
        <p class="muted">Available: ${b.available}</p>
        <button type="button" class="btn-primary full" data-action="book" data-isbn="${escapeAttr(b.isbn)}">Book this title</button>
      </article>
    `).join('');
    return `
    <section class="card">
      <div class="card-head">
        <div>
          <p class="eyebrow">Book a title</p>
          <h3>Pick from the catalogue</h3>
        </div>
        <div class="chip chip-neutral">Live inventory</div>
      </div>
      <div class="card-grid">${cards || '<p class="muted">No books available.</p>'}</div>
      ${renderPager(paged.page, paged.totalPages, 'books')}
    </section>`;
  }

  function renderCancel() {
    const paged = paginated(state.bookings, state.bookingPage, state.pageSize);
    const cards = paged.slice.map(o => `
      <article class="book-card">
        <p class="muted">Booking code</p>
        <h4>${escapeHtml(o.bookingId)}</h4>
        <p class="muted">Date: ${formatDate(o.bookingDate)}</p>
        <p class="muted">Quantity: ${o.quantity}</p>
        <button type="button" class="btn-ghost full" data-action="cancel" data-id="${escapeAttr(o.bookingId)}">Cancel order</button>
      </article>
    `).join('');
    return `
    <section class="card">
      <div class="card-head">
        <div>
          <p class="eyebrow">Cancel booking</p>
          <h3>Recently booked titles</h3>
        </div>
        <div class="chip chip-warning">Manual confirmation</div>
      </div>
      <div class="card-grid">${cards || '<p class="muted">No bookings found.</p>'}</div>
      ${renderPager(paged.page, paged.totalPages, 'bookings')}
    </section>`;
  }

  function escapeHtml(str) {
    return String(str || '').replace(/[&<>"']/g, c => ({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));
  }
  function escapeAttr(str) {
    return String(str || '').replace(/"/g, '&quot;');
  }

  function formatDate(d) {
    if (!d) return '';
    try {
      return new Date(d).toLocaleDateString();
    } catch {
      return d;
    }
  }

  async function setMode(mode) {
    state.mode = mode;
    setStatus('');
    if (mode === 'browse' || mode === 'delete' || mode === 'borrow') {
      await loadBooks();
    } else if (mode === 'cancel') {
      await loadBookings();
    } else if (mode === 'count') {
      await fetchCount();
    }
    render();
  }

  // Event delegation for mode switcher
  modeSwitcher.addEventListener('change', (e) => {
    if (e.target.name === 'mode') {
      setMode(e.target.value);
    }
  });

  // Action buttons
  document.body.addEventListener('click', async (e) => {
    const modeTarget = e.target.getAttribute('data-mode');
    if (modeTarget) {
      const radio = modeSwitcher.querySelector(`input[value="${modeTarget}"]`);
      if (radio) radio.checked = true;
      setMode(modeTarget);
      return;
    }
    const action = e.target.getAttribute('data-action');
    if (action === 'refresh') {
      setMode(state.mode);
    } else if (action === 'add-row') {
      state.newBooks.push(blankBook());
      render();
    } else if (action === 'remove-row') {
      if (state.newBooks.length > 1) state.newBooks.pop();
      render();
    } else if (action === 'submit-books') {
      await submitBooks();
    } else if (action === 'delete-selected') {
      await deleteSelected();
    } else if (action === 'book') {
      const isbn = e.target.getAttribute('data-isbn');
      const book = state.books.find(b => b.isbn === isbn);
      if (book) await makeBooking(book);
    } else if (action === 'cancel') {
      const id = e.target.getAttribute('data-id');
      const order = state.bookings.find(o => o.bookingId === id);
      if (order) await cancelBooking(order);
    }
    if (action === 'page') {
      const target = e.target.getAttribute('data-target');
      const dir = e.target.getAttribute('data-page');
      if (target === 'books') {
        const paged = paginated(state.books, state.bookPage, state.pageSize);
        if (dir === 'next' && state.bookPage < paged.totalPages) state.bookPage += 1;
        if (dir === 'prev' && state.bookPage > 1) state.bookPage -= 1;
      } else if (target === 'bookings') {
        const paged = paginated(state.bookings, state.bookingPage, state.pageSize);
        if (dir === 'next' && state.bookingPage < paged.totalPages) state.bookingPage += 1;
        if (dir === 'prev' && state.bookingPage > 1) state.bookingPage -= 1;
      }
      render();
    }
  });

  // Capture input changes in add form
  contentEl.addEventListener('input', (e) => {
    if (state.mode !== 'add') return;
    const container = e.target.closest('[data-idx]');
    if (!container) return;
    const idx = parseInt(container.getAttribute('data-idx'), 10);
    const field = e.target.getAttribute('data-field');
    if (Number.isInteger(idx) && field) {
      state.newBooks[idx][field] = e.target.value;
    }
  });

  // Capture checkbox selection in delete mode
  contentEl.addEventListener('change', (e) => {
    if (state.mode !== 'delete') return;
    if (e.target.type === 'checkbox' && e.target.hasAttribute('data-isbn')) {
      const isbn = e.target.getAttribute('data-isbn');
      if (e.target.checked) {
        if (!state.selectedIsbns.includes(isbn)) state.selectedIsbns.push(isbn);
      } else {
        state.selectedIsbns = state.selectedIsbns.filter(i => i !== isbn);
      }
    }
  });

  async function submitBooks() {
    const hasInvalid = state.newBooks.some(invalidBook);
    if (hasInvalid) {
      setStatus('Fill ISBN (>=5 chars), Title (>=3 chars), Pages (>0) and Available (>=0) for every row before submitting.', 'danger');
      return;
    }
    try {
      const res = await fetch(API.addBooks, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(state.newBooks)
      });
      if (!res.ok) {
        const body = await res.json().catch(() => ({}));
        throw new Error(body.message || 'Unable to save books.');
      }
      setStatus('Books added successfully.', 'success');
      state.newBooks = [blankBook()];
      await loadBooks();
      state.mode = 'browse';
      // update selected radio
      const browseRadio = modeSwitcher.querySelector('input[value="browse"]');
      if (browseRadio) browseRadio.checked = true;
    } catch (e) {
      setStatus(e.message, 'danger');
    } finally {
      render();
    }
  }

  async function deleteSelected() {
    if (!state.selectedIsbns.length) {
      setStatus('Select at least one book to delete.', 'info');
      return;
    }
    const payload = state.books.filter(b => state.selectedIsbns.includes(b.isbn));
    try {
      const res = await fetch(API.deleteBooks, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(payload)
      });
      if (!res.ok) throw new Error('Could not delete books.');
      setStatus('Removed selected books.', 'success');
      state.selectedIsbns = [];
      await loadBooks();
    } catch (e) {
      setStatus(e.message, 'danger');
    } finally {
      render();
    }
  }

  async function makeBooking(book) {
    try {
      const res = await fetch(API.makeBooking, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ bookingId: '', isbn: book.isbn, quantity: 1 })
      });
      if (!res.ok) throw new Error('Unable to complete booking.');
      setStatus('Booked successfully!', 'success');
      await loadBookings();
    } catch (e) {
      setStatus(e.message, 'danger');
    }
  }

  async function cancelBooking(order) {
    try {
      const res = await fetch(API.cancel, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ bookingId: order.bookingId })
      });
      if (!res.ok) throw new Error('Could not cancel booking.');
      setStatus('Booking cancelled.', 'success');
      await loadBookings();
    } catch (e) {
      setStatus(e.message, 'danger');
    } finally {
      render();
    }
  }

  // Initial load
  setMode('browse');
});
