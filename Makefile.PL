use inc::Module::Install;

RTx     'RT-Site-MauWorks';
license 'gpl_2';
repository 'https://github.com/bestpractical/rt-site-mauworks';

requires_rt '4.2.0';
rt_too_new '4.6.0';

sign;
WriteAll;
