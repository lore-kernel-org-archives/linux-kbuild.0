Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0222.hostedemail.com ([216.40.44.222]:58622 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750843AbcDZOCS (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Apr 2016 10:02:18 -0400
Date: Tue, 26 Apr 2016 10:02:14 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 2/2] localmodconfig: Reset certificate paths
Message-ID: <20160426100214.08f3569a@gandalf.local.home>
In-Reply-To: <1459619722-13695-2-git-send-email-bpoirier@suse.com>
References: <1459619722-13695-1-git-send-email-bpoirier@suse.com>
	<1459619722-13695-2-git-send-email-bpoirier@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Benjamin Poirier <bpoirier@suse.com>
Cc: Michal Marek <mmarek@suse.cz>, joeyli <jlee@suse.com>, "Yann E . MORIN " <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat,  2 Apr 2016 10:55:22 -0700
Benjamin Poirier <bpoirier@suse.com> wrote:

> When using `make localmodconfig` and friends, if the input config comes
> from a kernel that was built in a different environment (for example, the
> canonical case of using localmodconfig to trim a distribution kernel
> config) the key files for module signature checking will not be available
> and should be regenerated or omitted. Otherwise, the user will be faced
> with annoying errors when trying to build with the generated .config:
> 
> make[1]: *** No rule to make target 'keyring.crt', needed by 'certs/x509_certificate_list'.  Stop.
> Makefile:1576: recipe for target 'certs/' failed
> 
> Signed-off-by: Benjamin Poirier <bpoirier@suse.com>
> ---
>  scripts/kconfig/streamline_config.pl | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
> index 7036ae3..514735d 100755
> --- a/scripts/kconfig/streamline_config.pl
> +++ b/scripts/kconfig/streamline_config.pl
> @@ -610,6 +610,40 @@ foreach my $line (@config_file) {
>  	next;
>      }
>  
> +    if (/CONFIG_MODULE_SIG_KEY="(.+)"/) {
> +        my $orig_cert = $1;
> +        my $default_cert = "certs/signing_key.pem";
> +
> +        # Check that the logic in this script still matches the one in Kconfig
> +        if (!defined($depends{"MODULE_SIG_KEY"}) ||
> +            $depends{"MODULE_SIG_KEY"} !~ /"\Q$default_cert\E"/) {
> +            die "Assertion failure, update needed";

Instead of dieing here, what about just going back to the current
behavior, and ignore the sig keys?

-- Steve

> +        }
> +
> +        if ($orig_cert ne $default_cert && ! -f $orig_cert) {
> +            print STDERR "Module signature verification enabled but ",
> +                "module signing key \"$orig_cert\" not found. Resetting ",
> +                "signing key to default value.\n";
> +            print "CONFIG_MODULE_SIG_KEY=\"$default_cert\"\n";
> +        } else {
> +            print;
> +        }
> +        next;
> +    }
> +
> +    if (/CONFIG_SYSTEM_TRUSTED_KEYS="(.+)"/) {
> +        my $orig_keys = $1;
> +
> +        if (! -f $orig_keys) {
> +            print STDERR "System keyring enabled but keys \"$orig_keys\" ",
> +                "not found. Resetting keys to default value.\n";
> +            print "CONFIG_SYSTEM_TRUSTED_KEYS=\"\"\n";
> +        } else {
> +            print;
> +        }
> +        next;
> +    }
> +
>      if (/^(CONFIG.*)=(m|y)/) {
>  	if (defined($configs{$1})) {
>  	    if ($localyesconfig) {

