Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:34019 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752456AbcDZSva (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Apr 2016 14:51:30 -0400
Date: Tue, 26 Apr 2016 11:51:22 -0700
From: Benjamin Poirier <bpoirier@suse.com>
Subject: Re: [PATCH 2/2] localmodconfig: Reset certificate paths
Message-ID: <20160426185122.GA2979@f1.synalogic.ca>
References: <1459619722-13695-1-git-send-email-bpoirier@suse.com>
 <1459619722-13695-2-git-send-email-bpoirier@suse.com>
 <20160426100214.08f3569a@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160426100214.08f3569a@gandalf.local.home>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Michal Marek <mmarek@suse.cz>, joeyli <jlee@suse.com>, "Yann E . MORIN " <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 2016/04/26 10:02, Steven Rostedt wrote:
> On Sat,  2 Apr 2016 10:55:22 -0700
> Benjamin Poirier <bpoirier@suse.com> wrote:
> 
> > When using `make localmodconfig` and friends, if the input config comes
> > from a kernel that was built in a different environment (for example, the
> > canonical case of using localmodconfig to trim a distribution kernel
> > config) the key files for module signature checking will not be available
> > and should be regenerated or omitted. Otherwise, the user will be faced
> > with annoying errors when trying to build with the generated .config:
> > 
> > make[1]: *** No rule to make target 'keyring.crt', needed by 'certs/x509_certificate_list'.  Stop.
> > Makefile:1576: recipe for target 'certs/' failed
> > 
> > Signed-off-by: Benjamin Poirier <bpoirier@suse.com>
> > ---
> >  scripts/kconfig/streamline_config.pl | 34 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> > 
> > diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
> > index 7036ae3..514735d 100755
> > --- a/scripts/kconfig/streamline_config.pl
> > +++ b/scripts/kconfig/streamline_config.pl
> > @@ -610,6 +610,40 @@ foreach my $line (@config_file) {
> >  	next;
> >      }
> >  
> > +    if (/CONFIG_MODULE_SIG_KEY="(.+)"/) {
> > +        my $orig_cert = $1;
> > +        my $default_cert = "certs/signing_key.pem";
> > +
> > +        # Check that the logic in this script still matches the one in Kconfig
> > +        if (!defined($depends{"MODULE_SIG_KEY"}) ||
> > +            $depends{"MODULE_SIG_KEY"} !~ /"\Q$default_cert\E"/) {
> > +            die "Assertion failure, update needed";
> 
> Instead of dieing here, what about just going back to the current
> behavior, and ignore the sig keys?

I was concerned that the warning may go unnoticed but I think you're right. It
is the same kind of concern between a BUG() or a WARN_ON(). In this case it
certainly is possible to keep going and ignore the certificate check, as you
suggest.
