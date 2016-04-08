Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:32942 "EHLO
	smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758180AbcDHPAH (ORCPT
	<rfc822;groupwise-linux-kbuild@vger.kernel.org:0:0>);
	Fri, 8 Apr 2016 11:00:07 -0400
Date: Fri, 8 Apr 2016 22:59:56 +0800
From: joeyli <jlee@suse.com>
Subject: Re: [PATCH 2/2] localmodconfig: Reset certificate paths
Message-ID: <20160408145956.GI29941@linux-rxt1.site>
References: <1459619722-13695-1-git-send-email-bpoirier@suse.com>
 <1459619722-13695-2-git-send-email-bpoirier@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1459619722-13695-2-git-send-email-bpoirier@suse.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Benjamin Poirier <bpoirier@suse.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Michal Marek <mmarek@suse.cz>, "Yann E . MORIN " <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Apr 02, 2016 at 10:55:22AM -0700, Benjamin Poirier wrote:
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

Tested-by: Lee, Chun-Yi <jlee@suse.com>


Regards
Joey Lee

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
> -- 
> 2.7.2
