const root = document.documentElement;
const menuBtn = document.querySelector('.menu-btn');
const nav = document.querySelector('.nav');
const themeBtn = document.querySelector('.theme-btn');
const form = document.querySelector('.form');
const status = document.querySelector('.form-status');

menuBtn?.addEventListener('click', () => {
  const open = nav.classList.toggle('open');
  menuBtn.setAttribute('aria-expanded', String(open));
});

themeBtn?.addEventListener('click', () => {
  const isLight = root.dataset.theme === 'light';
  root.dataset.theme = isLight ? 'dark' : 'light';
  themeBtn.setAttribute('aria-pressed', String(!isLight));
});

form?.addEventListener('submit', (e) => {
  e.preventDefault();
  const data = new FormData(form);
  const name = String(data.get('name') || '').trim();
  status.textContent = `Thanks, ${name || 'there'}! Your message is ready to wire to a backend.`;
  form.reset();
});
