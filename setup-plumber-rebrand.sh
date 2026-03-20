#!/bin/bash

# 1. Update Navigation
cat << 'INNEREOF' > src/navigation.ts
import { getPermalink } from './utils/permalinks';

export const headerData = {
  links: [
    { text: 'Grow Your Business', href: getPermalink('/#features') },
    { text: 'How It Works', href: getPermalink('/#howitworks') },
    { text: 'The Story', href: getPermalink('/about') },
    { text: 'Lifetime Access - Order Now', href: getPermalink('/pricing') },
  ],
  actions: [
    { text: 'Get Lifetime Access - $99', variant: 'primary', href: '/pricing' }
  ],
};

export const footerData = {
  links: [
    {
      title: 'Grow Your Local Buzz',
      links: [
        { text: "Claim Your Spot – Just $99", href: getPermalink('/pricing') },
        { text: 'Why We Love Plumbers', href: getPermalink('/about') },
        { text: 'Get in Touch', href: getPermalink('/contact') },
      ],
    },
  ],
  secondaryLinks: [
    { text: 'Terms of Service', href: getPermalink('/terms') },
    { text: 'Privacy Policy', href: getPermalink('/privacy') },
  ],
  socialLinks: [],
  footNote: `
    <div class="inline-flex items-center justify-center flex-wrap">
      <img class='w-5 h-5 mr-2 rounded-sm align-middle' src='/images/footer-icon.webp' alt='Plumber Pride' loading='lazy'>
      <span class="align-middle">🔧 Your reliability, amplified. | © ${new Date().getFullYear()} <a class="text-blue-600 underline dark:text-muted" href="#">Plumber Pride</a> All rights reserved.</span>
    </div>
  `,
};
INNEREOF

# 2. Update Index Page
cat << 'INNEREOF' > src/pages/index.astro
---
import Layout from '~/layouts/PageLayout.astro';
import Header from '~/components/widgets/Header.astro';
import Hero2 from '~/components/widgets/Hero2.astro';
import Features from '~/components/widgets/Features.astro';
import Steps2 from '~/components/widgets/Steps2.astro';
import Content from '~/components/widgets/Content.astro';
import Pricing from '~/components/widgets/Pricing.astro';
import { headerData } from '~/navigation';
import FAQs from '~/components/widgets/FAQs.astro';
import { lifetimeDeal } from '~/data/pricingData';

const metadata = {
  title: 'The Five-Star Secret to a Full Schedule | Plumber Pride | $99 Forever',
  description: 'The seamless review engine built for busy plumbers. Automatically gather five-star love on Google, protect your reputation, and fill your schedule on autopilot.',
  ignoreTitleTemplate: true,
};
---

<Layout metadata={metadata}>
  <Fragment slot="header">
    <Header {...headerData} isSticky />
  </Fragment>
  
  <Hero2
    tagline="The #1 Review Engine for Plumbers & Home Services ⭐⭐⭐⭐⭐"
    title='<span class="text-accent dark:text-white">Get More 5-Star Reviews Before You Leave the Job Site.</span>'
    subtitle="We build your automated review engine, design your truck magnets/QR codes, and sync your best reviews to your site. Capture the 'relief glow' when the water is back on!"
    actions={[
      { variant: 'primary', text: 'Claim My Lifetime Deal Today', href: '/pricing/' },
      { text: 'See How It Works', href: '#howitworks' },
    ]}
    video="/images/hero-animation.mp4" 
    poster="/images/hero-poster.webp" 
    image={{ width: 1024, height: 576 }}
    testimonial={{
        quote: "⭐⭐⭐⭐⭐ This is a game-changer! My phone doesn't stop ringing and my Google rating shot up in weeks. It paid for itself in one service call.",
        name: "Mike D., Plumbing Contractor"
    }}
  />
  
  <Features
    class="-mt-16"
    id="features"
    title="Everything You Need to Dominate Local Search"
    subtitle="We handle the tech. You focus on the pipes. Here is how we help you grow your business:"
    columns={2}
    items={[
        { title: 'The "Job-Done" Capture', description: 'Catch clients when they feel most relieved—right when the repair is finished. Our 3-click QR system makes it effortless for them to rave about you.', icon: 'tabler:tool' },
        { title: 'Negative Review Shield', description: 'Unhappy customer? Our system catches private feedback first, allowing you to fix the issue before a 1-star rating hits your public Google page.', icon: 'tabler:shield-check' },
        { title: 'Done-For-You Setup', description: 'Hate tech? We do the heavy lifting. We configure your Google sync, design your codes, and help you install the widget.', icon: 'tabler:settings-automation' },
        { title: 'No Monthly "SaaS Tax"', description: 'Stop paying $150/month for reputation software. One payment of $99 secures your system for the life of your business.', icon: 'tabler:pig-money' },
    ]}
  />

<Content
    class="-mt-16"
    items={[
        { title: 'Rank Higher on Google Maps', description: 'Google prioritizes plumbers with frequent, fresh reviews. We help you jump to the top of the "Plumbers Near Me" list.', icon: 'tabler:map-pin' },
        { title: 'Showcase Your Reliability', description: 'Automatically sync your best 5-star Google reviews into a beautiful wall of love on your website to build instant trust.', icon: 'tabler:user-check' },
        { title: 'Beat the Competition', description: 'When homeowners compare contractors, the one with 100+ reviews always wins. We make sure that company is yours.', icon: 'tabler:trending-up' },
        { title: 'Voice Search Priority', description: 'Be the first name Siri and Alexa speak when someone says, "Find me the best plumber in town."', icon: 'tabler:microphone' },
    ]}
    image={{ src: '/images/testimonial-2.webp', alt: 'Plumber working on a repair' }}
  >
    <Fragment slot="content">
      <h3 class="text-2xl font-bold tracking-tight dark:text-white sm:text-3xl mb-2">
        <span class="text-accent dark:text-white">Why Google Reviews are Your Best Sales Team</span>
      </h3>
    </Fragment>
    <Fragment slot="bg"><div class="absolute inset-0 bg-blue-50 dark:bg-transparent"></div></Fragment>
  </Content>

  <div id="howitworks" class="scroll-mt-20">
    <Steps2
      title="From Setup to 5-Stars in 24 Hours"
      subtitle="Three simple steps to automate your business reputation."
      items={[
        { title: 'Step 1: Secure Your License', description: 'Purchase your $99 lifetime deal. No hidden fees or recurring subscriptions.', icon: 'tabler:number-1' },
        { title: 'Step 2: We Build Your Engine', description: 'Tell us your company name. We set up your profile, Google sync, and custom QR codes.', icon: 'tabler:number-2' },
        { title: 'Step 3: Watch the Reviews Roll In', description: 'Keep the QR code on your phone or truck. Clients scan, review, and your rating climbs.', icon: 'tabler:number-3' },
      ]}
      image={{ src: '/images/testimonial-6.webp', alt: 'Plumber Pride system', width: 1024, height: 1024 }}
    />
  </div>

  <Pricing
    title={`<span class="text-accent dark:text-white">One-Time Investment. Lifetime Growth.</span>`}
    prices={[lifetimeDeal]}
  />

  <FAQs
    class="-mt-16 px-6"
    title="Frequently Asked Questions"
    items={[
        { title: 'How is this different from a QR code I make myself?', description: 'A standard QR code just opens a link. Our engine includes a reputation filter to catch unhappy clients privately, a website widget to display reviews, and a flow optimized for busy homeowners.', icon: 'tabler:help' },
        { title: 'Do I need to give you my Google login?', description: 'No. We use your public Google Business link to sync everything. Your account stays 100% secure.', icon: 'tabler:lock' },
        { title: 'What if I have multiple trucks/locations?', description: 'Each Google Maps location requires its own setup. Contact us for Multi-Truck or Multi-Location discounts!', icon: 'tabler:truck' },
        { title: 'Is it really a one-time payment?', description: 'Yes. Most competitors charge $100+ every month. We charge a one-time setup fee for our labor and logic. You own it for life.', icon: 'tabler:currency-dollar' },
    ]}
  >
    <Fragment slot="bg"><div class="absolute inset-0 bg-blue-50 dark:bg-transparent"></div></Fragment>
  </FAQs>
</Layout>
INNEREOF

# 3. Update About Page
cat << 'INNEREOF' > src/pages/about.astro
---
import Hero2 from '~/components/widgets/Hero2.astro';
import Content from '~/components/widgets/Content.astro';
import Layout from '~/layouts/PageLayout.astro';
import Pricing from '~/components/widgets/Pricing.astro';
import { lifetimeDeal } from '~/data/pricingData';

const metadata = {
  title: 'Our Mission - Plumber Pride | Built for Contractors',
  description: 'We built Plumber Pride because plumbing is essential, but business is about trust. Learn how we help plumbers dominate Google.',
  ignoreTitleTemplate: true,
};
---

<Layout metadata={metadata}>
<Hero2
    tagline="We Grow Your Business ⭐⭐⭐⭐⭐"
    title='You Fix the Leaks.<br/><span class="text-accent dark:text-white">We Help You Build Your Reputation.</span>'
    subtitle="Amazing contractors lose jobs without reviews. We ensure your reputation matches your skill. No monthly fees—just an automated system to keep your schedule full."
    video="/images/hero-animation.mp4" 
    poster="/images/hero-poster.webp"
    actions={[{ variant: 'primary', text: 'Claim My Lifetime Access - $99', href: '/pricing/' }]}
  />
  <Content
    isReversed
    items={[
        { title: 'The "Handshake" Moment', description: 'The best time for a review is the second you finish the job and the customer sees everything working perfectly. Your branded QR codes capture that relief instantly.', icon: 'tabler:sparkles' },
        { title: 'Local Search SEO', description: 'When someone searches "emergency plumber near me," Google looks for star rating and recency. We automate both.', icon: 'tabler:map-pin' },
        { title: 'Customer Retention', description: 'A customer who leaves a 5-star review is far more likely to call you next time. Our system turns a one-off repair into a lifelong customer.', icon: 'tabler:users' },
    ]}
  >
    <Fragment slot="content">
      <h3 class="text-2xl font-bold tracking-tight dark:text-white sm:text-3xl mb-2">
        Why your business needs <span class="text-accent">Reviews on Autopilot ⭐⭐⭐⭐⭐</span>
      </h3>
      <p>Homeowners look at screens, not yellow pages. Your reviews are your digital handshake—we make sure yours is a 5-star introduction.</p>
    </Fragment>
    <Fragment slot="image">
       <img src="/images/testimonial-4.webp" alt="Happy plumbing customer" class="rounded-lg shadow-xl w-full" />
    </Fragment>
  </Content>

  <Content
    items={[
      { title: 'Zero Maintenance', description: 'We know you’re busy in the field. Once we set up your system, you never have to log in or manage anything.', icon: 'tabler:settings' },
      { title: 'The "Wall of Love" Widget', description: 'We automatically sync and showcase your best reviews on your website, building instant trust with new visitors 24/7.', icon: 'tabler:stars' },
      { title: 'One-Time Payment', description: 'We don’t believe in monthly fees that eat your profits. $99 once, and you own the system for life.', icon: 'tabler:coin' },
    ]}
  >
    <Fragment slot="content">
      <h2 class="text-3xl font-bold tracking-tight dark:text-white sm:text-4xl mb-4">Our Commitment to Your Success</h2>
      <p class="text-xl text-muted dark:text-slate-400 mb-8">We handle the technical hurdles so you can stay focused on the job. We are a partner in your growth, ensuring your online presence is as solid as your work.</p>
    </Fragment>
  </Content>

  <Pricing class="pb-0" title={`<span class="text-accent dark:text-white">Invest in Your Business Future.</span>`} prices={[lifetimeDeal]} />
</Layout>
INNEREOF

# 4. Update Pricing and Components
sed -i "s/Let's Talk About Your Salon/Let's Talk About Your Business/g" src/pages/contact.astro
sed -i "s/faster than a blow-dry/faster than an emergency repair/g" src/pages/contact.astro
sed -i 's/HairTestimonial/PlumberPride/g' src/components/widgets/Pricing.astro
sed -i 's/HTFP99/PPFP99/g' src/components/widgets/Pricing.astro
sed -i 's/Salon Name/Company Name/g' src/components/widgets/Pricing.astro
sed -i 's/Salon Business Name/Plumbing Business Name/g' src/components/widgets/Pricing.astro

# 5. Update Announcement
cat << 'INNEREOF' > src/components/widgets/Announcement.astro
---
---
<div class="dark text-sm bg-black hidden md:flex items-center justify-center overflow-hidden px-3 py-2 relative text-ellipsis whitespace-nowrap">
  <div class="flex items-center gap-2">
    <span>⭐️⭐️⭐️⭐️⭐️ </span>
    <span class="text-white font-medium">
      ✨ Capture glowing reviews effortlessly and boost your plumbing bookings.
    </span>
  </div>
  <div class="absolute right-4 top-0 h-full flex items-center">
    <span class="text-white font-medium">Same-day setup. Just $99</span>
  </div>
</div>
INNEREOF

# 6. Git Push
git add .
git commit -m "Rebrand complete: Plumber Pride"
git push origin main

echo "Rebrand successfully applied and pushed to GitHub!"
