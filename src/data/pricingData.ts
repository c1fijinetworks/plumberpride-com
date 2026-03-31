export const lifetimeDeal = {
  title: 'Lifetime Deal (First 300 Plumbers)',
  subtitle: 'Lock in your $99 forever deal today.<br/><strong class="text-red-600 dark:text-red-400 text-lg">Price increases to $29/mo after the first 300 spots are gone.</strong>',
  price: 99,
  period: 'One-time payment',
  items: [
    { description: '60 seconds Testimonial Engine' },
    { description: 'Full Setup for you!' },
    { description: 'Automated Testimonial Collection' },
    { description: 'Beautiful Widget for your Website' },
    { description: 'No monthly subscription, ever!' },
    { description: 'Includes All Future Updates' },
    { description: 'Zero Risk. 100% Satisfaction Guaranteed!' },
  ],
  callToAction: {
    target: '_top' as const,
    text: 'Claim 1 of 300 Lifetime Spots',
    href: '#', 
    variant: 'success', 
  },
  hasRibbon: true,
  ribbonTitle: 'Selling Fast',
};
