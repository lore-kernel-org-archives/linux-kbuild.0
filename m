Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:44386 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726777AbfCRTVR (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Mar 2019 15:21:17 -0400
Date: Mon, 18 Mar 2019 15:21:13 -0400
From: Joe Lawrence <joe.lawrence@redhat.com>
Subject: Re: [PATCH v2 7/8] livepatch: Add sample livepatch module
Message-ID: <20190318192113.GA23220@redhat.com>
References: <20190301141313.15057-1-jmoreira@suse.de>
 <20190301141313.15057-8-jmoreira@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190301141313.15057-8-jmoreira@suse.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joao Moreira <jmoreira@suse.de>
Cc: live-patching@vger.kernel.org, mbenes@suse.cz, pmladek@suse.cz, jikos@suse.cz, nstange@suse.de, jpoimboe@redhat.com, khlebnikov@yandex-team.ru, jeyu@kernel.org, matz@suse.de, linux-kernel@vger.kernel.org, yamada.masahiro@socionext.com, linux-kbuild@vger.kernel.org, michal.lkml@markovi.net

On Fri, Mar 01, 2019 at 11:13:12AM -0300, Joao Moreira wrote:
> From: Josh Poimboeuf <jpoimboe@redhat.com>
> 
> Add a new livepatch sample in samples/livepatch/ to make use of
> symbols that must be post-processed to enable load-time relocation
> resolution. As the new sample is to be used as an example, it is
> annotated with KLP_MODULE_RELOC and with KLP_SYMPOS macros.
> 
> The livepatch sample updates the function cmdline_proc_show to
> print the string referenced by the symbol saved_command_line
> appended by the string "livepatch=1".
> 
> Update livepatch-sample.c to remove livepatch MODULE_INFO
> statement.
> 
> [jmoreira:
> * update module to use KLP_SYMPOS
> * Comments on symbol resolution scheme
> * Update Makefile
> * Remove MODULE_INFO statement
> * Changelog
> ]
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
> Signed-off-by: Joao Moreira <jmoreira@suse.de>
> ---
>  samples/livepatch/Makefile                     |   2 +
>  samples/livepatch/livepatch-annotated-sample.c | 113 +++++++++++++++++++++++++
>  2 files changed, 115 insertions(+)
>  create mode 100644 samples/livepatch/livepatch-annotated-sample.c
> 
> [ ... snip ... ]
>
> diff --git a/samples/livepatch/livepatch-annotated-sample.c b/samples/livepatch/livepatch-annotated-sample.c
> new file mode 100644
> index 000000000000..44d9e9542db1
> --- /dev/null
> +++ b/samples/livepatch/livepatch-annotated-sample.c

Super small nit, but I shuffled the annotated-sample code around so it
better matched the original sample.  This minimized the diff when I
compared the two versions to see what was added for sympos annotation:

  [squash] livepatch: adjust annotated sample formatting 
  https://github.com/torvalds/linux/commit/ce49c70e85cf87e513de3bcf64953de191c3c6d7

> [ ... snip ... ]
>
> +static int livepatch_init(void)
> +{
> +	int ret;
> +
> +	ret = klp_register_patch(&patch);
> +	if (ret)
> +		return ret;
> +	ret = klp_enable_patch(&patch);
> +	if (ret) {
> +		WARN_ON(klp_unregister_patch(&patch));
> +		return ret;
> +	}
> +	return 0;
> +}
> +
> +static void livepatch_exit(void)
> +{
> +	WARN_ON(klp_unregister_patch(&patch));
> +}

v5.0 deprecates klp_register_patch(), klp_unregister_patch(), and
klp_disable_patch(), so adjust the sample accordingly:

  [squash] livepatch: rebase the annotated sample 
  https://github.com/torvalds/linux/commit/fc04952376cfd8281eb663bd2ce18fec27eb42b2

-- Joe
