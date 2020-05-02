Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727791AbgEBNbF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 2 May 2020 09:31:05 -0400
Date: Sat, 2 May 2020 21:30:54 +0800
From: Changbin Du <changbin.du@gmail.com>
Subject: Re: [PATCH] streamline_config.pl: add LOCALMODCONFIG_PRESERVE to
 preserve some kconfigs
Message-ID: <20200502133054.gx77eoas7u7gnxxm@mail.google.com>
References: <20200501023708.108830-1-changbin.du@gmail.com>
 <20200501130729.3a3e4994@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200501130729.3a3e4994@gandalf.local.home>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Changbin Du <changbin.du@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Fri, May 01, 2020 at 01:07:29PM -0400, Steven Rostedt wrote:
> On Fri,  1 May 2020 10:37:08 +0800
> Changbin Du <changbin.du@gmail.com> wrote:
> 
> > Sometimes it is useful to preserve batches of configs when making
> > localmodconfig. For example, I usually don't want any usb and fs
> > modules to be disabled. Now we can do it by:
> > 
> >  $ make LOCALMODCONFIG_PRESERVE="drivers/usb;fs" localmodconfig
> 
> That's too much typing ;-) What about just "KEEP='drivers/usb;fs'"?
>
I think we'd better use a long name since it will be passed to the entire kbuild.
And we alreay have one named LOCALMODCONFIG_DEBUG. The prefix LOCALMODCONFIG_
can help to avoid namespace pollution.

> 
> > 
> > Signed-off-by: Changbin Du <changbin.du@gmail.com>
> > ---
> >  Documentation/admin-guide/README.rst |  8 +++++++-
> >  scripts/kconfig/streamline_config.pl | 23 +++++++++++++++++++++++
> >  2 files changed, 30 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
> > index cc6151fc0845..6deff95362f8 100644
> > --- a/Documentation/admin-guide/README.rst
> > +++ b/Documentation/admin-guide/README.rst
> > @@ -209,10 +209,16 @@ Configuring the kernel
> >                             store the lsmod of that machine into a file
> >                             and pass it in as a LSMOD parameter.
> >  
> > +                           Also, you can preserve modules in certen folders
> > +                           or kconfig files by spcifying there paths in
> > +                           parameter LOCALMODCONFIG_PRESERVE.
> > +
> >                     target$ lsmod > /tmp/mylsmod
> >                     target$ scp /tmp/mylsmod host:/tmp
> >  
> > -                   host$ make LSMOD=/tmp/mylsmod localmodconfig
> > +                   host$ make LSMOD=/tmp/mylsmod \
> > +                           LOCALMODCONFIG_PRESERVE="drivers/usb;drivers/gpu;fs" \
> > +                           localmodconfig
> >  
> >                             The above also works when cross compiling.
> >  
> > diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
> > index e2f8504f5a2d..ab5d1e10a5d0 100755
> > --- a/scripts/kconfig/streamline_config.pl
> > +++ b/scripts/kconfig/streamline_config.pl
> > @@ -143,6 +143,7 @@ my %depends;
> >  my %selects;
> >  my %prompts;
> >  my %objects;
> > +my %config2kfile;
> >  my $var;
> >  my $iflevel = 0;
> >  my @ifdeps;
> > @@ -201,6 +202,7 @@ sub read_kconfig {
> >  	if (/^\s*(menu)?config\s+(\S+)\s*$/) {
> >  	    $state = "NEW";
> >  	    $config = $2;
> > +	    $config2kfile{"CONFIG_$config"} = $kconfig;
> >  
> >  	    # Add depends for 'if' nesting
> >  	    for (my $i = 0; $i < $iflevel; $i++) {
> > @@ -592,6 +594,22 @@ while ($repeat) {
> >  
> >  my %setconfigs;
> >  
> > +my @presevered_kconfigs;
> > +@presevered_kconfigs = split(/;/,$ENV{LOCALMODCONFIG_PRESERVE}) if (defined($ENV{LOCALMODCONFIG_PRESERVE}));
> > +
> > +sub in_presevered_kconfigs {
> > +    my $kconfig = $config2kfile{$_[0]};
> > +    if (!defined($kconfig)) {
> > +        return 0;
> > +    }
> > +    foreach my $excl (@presevered_kconfigs) {
> > +        if($kconfig =~ /^$excl/) {
> > +            return 1;
> > +        }
> > +    }
> > +    return 0;
> > +}
> > +
> >  # Finally, read the .config file and turn off any module enabled that
> >  # we could not find a reason to keep enabled.
> >  foreach my $line (@config_file) {
> > @@ -644,6 +662,11 @@ foreach my $line (@config_file) {
> >      }
> >  
> >      if (/^(CONFIG.*)=(m|y)/) {
> > +        if (in_presevered_kconfigs($1)) {
> > +            dprint "Preserve config $1";
> > +            print;
> > +            next;
> > +        }
> >  	if (defined($configs{$1})) {
> >  	    if ($localyesconfig) {
> >  	        $setconfigs{$1} = 'y';
> 
> I'll have to test it out, but I like the idea!
> 
> -- Steve

-- 
Cheers,
Changbin Du
