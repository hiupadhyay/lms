document.addEventListener('DOMContentLoaded', () => {
  const formEl = document.getElementById('register-form');
  const successBox = document.getElementById('register-success');
  const errorBox = document.getElementById('register-error');
  const successText = document.getElementById('register-success-text');
  const errorText = document.getElementById('register-error-text');
  const submitBtn = document.getElementById('register-submit');

  const showSuccess = (msg) => {
    successText.textContent = msg;
    successBox.style.display = 'block';
    errorBox.style.display = 'none';
  };

  const showError = (msg) => {
    errorText.textContent = msg;
    errorBox.style.display = 'block';
    successBox.style.display = 'none';
  };

  const clearAlerts = () => {
    successBox.style.display = 'none';
    errorBox.style.display = 'none';
  };

  formEl.addEventListener('submit', async (e) => {
    e.preventDefault();
    clearAlerts();
    const data = new FormData(formEl);
    const email = data.get('email')?.trim();
    const name = data.get('name')?.trim();
    const dob = data.get('dob');
    const password = data.get('password');
    const repeatPassword = data.get('repeatPassword');

    if (!email || !name || !dob || !password || !repeatPassword) {
      showError('All fields are required.');
      return;
    }
    if (password !== repeatPassword) {
      showError('Passwords do not match.');
      return;
    }

    submitBtn.disabled = true;
    try {
      const res = await fetch('/user/register', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ email, name, dob, password, repeatPassword })
      });
      if (!res.ok) {
        const body = await res.json().catch(() => ({}));
        showError(body.message || 'Unable to create account right now.');
      } else {
        formEl.reset();
        showSuccess('Account created. You can go to the catalogue now.');
      }
    } catch (err) {
      showError('Something went wrong. Please retry.');
    } finally {
      submitBtn.disabled = false;
    }
  });
});
