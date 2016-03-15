Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:38965 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932347AbcCOUdU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 15 Mar 2016 16:33:20 -0400
Subject: Re: [PATCH v6 5/8] kbuild: add fine grained build dependencies for
 exported symbols
References: <1457923336-2732-1-git-send-email-nicolas.pitre@linaro.org>
 <1457923336-2732-6-git-send-email-nicolas.pitre@linaro.org>
From: Michal Marek <mmarek@suse.com>
Message-ID: <56E8718E.9010607@suse.com>
Date: Tue, 15 Mar 2016 21:33:18 +0100
MIME-Version: 1.0
In-Reply-To: <1457923336-2732-6-git-send-email-nicolas.pitre@linaro.org>
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Dne 14.3.2016 v 03:42 Nicolas Pitre napsal(a):
> +# Filter out exported kernel symbol names from the preprocessor output.
> +# See also __KSYM_DEPS__ in include/linux/export.h.
> +# We disable the depfile generation here, so as not to overwrite the existing
> +# depfile while fixdep is parsing it
> +flags_nodeps = $(filter-out -Wp$(comma)-M%, $($(1)))
> +ksym_dep_filter =                                                            \
> +	case "$(1)" in                                                       \
> +	cc_*_c) $(CPP) $(call flags_nodeps,c_flags) -D__KSYM_DEPS__ $< ;;    \
> +	as_*_S) $(CPP) $(call flags_nodeps,a_flags) -D__KSYM_DEPS__ $< ;;    \
> +	cpp_lds_S) : ;;                                                      \
> +	*) echo "Don't know how to preprocess $(1)" >&2; false ;;            \
> +	esac | sed -rn 's/^.*=== __KSYM_(.*) ===.*$$/KSYM_\1/p'
> +
> +cmd_and_fixdep =                                                             \
> +	$(echo-cmd) $(cmd_$(1));                                             \
> +	$(ksym_dep_filter) |                                                 \
> +		scripts/basic/fixdep -e $(depfile) $@ '$(make-cmd)'          \
> +			> $(dot-target).tmp;	                             \
> +	rm -f $(depfile);                                                    \
> +	mv -f $(dot-target).tmp $(dot-target).cmd;
> +
> +endif

Not sure what happened this time, but I got

drivers/md/.dm-round-robin.mod.o.cmd:5: *** unterminated call to
function 'wildcard': missing ')'.  Stop.

The depfile is indeed corrupt (truncated):
tail drivers/md/.dm-round-robin.mod.o.cmd
  arch/x86/include/asm/disabled-features.h \
    $(wildcard include/config/x86/intel/mpx.h) \
  arch/x86/include/asm/rmwcc.h \
  arch/x86/include/asm/barrier.h \
    $(wildcard include/config/x86/ppro/fence.h) \
  arch/x86/include/asm/nops.h \
    $(wildcard include/config/mk7.h) \
  include/asm-generic/barrier.h \
  include/asm-generic/bitops/find.h \
    $(wildcard include/config/generic/

The file is exactly 8kB long:
$ ls -l drivers/md/.dm-round-robin.mod.o.cmd
-rw-r--r-- 1 mmarek users 8192 Mar  8 13:33
drivers/md/.dm-round-robin.mod.o.cmd

Michal
