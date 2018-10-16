Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:59255 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727003AbeJPWQ0 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Oct 2018 18:16:26 -0400
Date: Tue, 16 Oct 2018 09:25:40 -0500
From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [PATCH 2/3] objtool: move libelf check out of top Makefile
Message-ID: <20181016142540.pxlwu3ft6n2b4pgj@treble>
References: <1539681053-24388-1-git-send-email-yamada.masahiro@socionext.com>
 <1539681053-24388-3-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1539681053-24388-3-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Bernd Edlinger <bernd.edlinger@hotmail.de>, Borislav Petkov <bp@suse.de>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

On Tue, Oct 16, 2018 at 06:10:52PM +0900, Masahiro Yamada wrote:
> Another behavioral change is, missing libelf for CONFIG_STACK_VALIDATION
> was previously a warning, but now a error.

This behavioral change should be fine.  It was already an error for
UNWINDER_ORC, so this would only upgrade a warning to an error for
people using STACK_VALIDATION without ORC, which should be a small
number of people by this point.

> diff --git a/scripts/Makefile.toolcheck b/scripts/Makefile.toolcheck
> index f3c165d..bc26fc0 100644
> --- a/scripts/Makefile.toolcheck
> +++ b/scripts/Makefile.toolcheck
> @@ -12,6 +12,11 @@ include include/config/auto.conf
>  __toolcheck:
>  	@:
>  
> +chk_stack_validation = echo "int main() {}" | $(HOSTCC) -xc -o /dev/null -lelf -
> +msg_stack_validation = "libelf is necessary for building the objtool." \
> +		       "Please install libelf-dev, libelf-devel or elfutils-libelf-devel."
> +toolcheck-$(CONFIG_STACK_VALIDATION) += stack_validation
> +
>  PHONY += $(toolcheck-y)
>  __toolcheck: $(toolcheck-y)

This is a nice improvement.

It would probably be a good idea to clarify to the user which config
option(s) are the cause for the error, by putting
"CONFIG_STACK_VALIDATION" in the error string, for example.

Though, for this particular case, it would be clearer to have a
different error, based on which option is enabled, like we had before.

Like:


ifdef CONFIG_UNWINDER_ORC

chk_unwinder_orc = echo "int main() {}" | $(HOSTCC) -xc -o /dev/null -lelf -
msg_unwinder_orc = "Cannot build objtool to generate ORC metadata for CONFIG_UNWINDER_ORC=y.  " \
		       "Please install libelf-dev, libelf-devel or elfutils-libelf-devel."
toolcheck-$(CONFIG_UNWINDER_ORC) += unwinder_orc

else

chk_stack_validation = echo "int main() {}" | $(HOSTCC) -xc -o /dev/null -lelf -
msg_stack_validation = "Cannot build objtool for CONFIG_STACK_VALIDATION=y.  " \
		       "Please install libelf-dev, libelf-devel or elfutils-libelf-devel."
toolcheck-$(CONFIG_STACK_VALIDATION) += stack_validation

endif


What do you think?

-- 
Josh
