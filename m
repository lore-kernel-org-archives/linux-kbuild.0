Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:44161 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751356AbcCEHML (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 5 Mar 2016 02:12:11 -0500
Date: Sat, 5 Mar 2016 08:12:08 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH v5 5/8] kbuild: add fine grained build dependencies for
	exported symbols
Message-ID: <20160305071208.GA25757@pobox.suse.cz>
References: <1457070050-1564-1-git-send-email-nicolas.pitre@linaro.org> <1457070050-1564-6-git-send-email-nicolas.pitre@linaro.org> <56DA118E.20106@suse.com> <56DA1201.9010605@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56DA1201.9010605@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Mar 04, 2016 at 11:53:53PM +0100, Michal Marek wrote:
> Dne 4.3.2016 v 23:51 Michal Marek napsal(a):
> > Dne 4.3.2016 v 06:40 Nicolas Pitre napsal(a):
> >> +cmd_and_fixdep =                                                             \
> >> +	$(echo-cmd) $(cmd_$(1));                                             \
> >> +	$(ksym_dep_filter) |                                                 \
> >> +		scripts/basic/fixdep -e $(depfile) $@ '$(make-cmd)'          \
> >> +			> $(dot-target).tmp;	                             \
> >> +	rm -f $(depfile);                                                    \
> >> +	mv -f $(dot-target).tmp $(dot-target).cmd;
> > 
> > While trying this, I got a SIGBUS from fixdep once. My theory is that
> > the depfile is mmap()ed by fixdep and modified by the preprocesor run at
> > the same time. I could not reproduce this so far (still trying). But if
> > it's really this race, the fix would be to disable dependency generation
> > in the preprocessor by passing -Wp,MD,/dev/null or somesuch. But we
> > never had this problem with genksyms, which is weird. It could as well
> > be that my build machine's memory is faulty :(.
> 
> Actually, genksyms does not ran in parallel. neither before nor after
                              run
> this patch.

I reproduced the SIGBUS after a few iterations, and it crashes in
parse_dep_file(). I'm now testing this

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 0be7e09ba381..4fdd8348acf6 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -270,10 +270,12 @@ else
 
 # Filter out exported kernel symbol names from the preprocessor output.
 # See also __KSYM_DEPS__ in include/linux/export.h.
+# We disable the depfile generation here, so as not to overwrite the existing
+# depfile while fixdep is parsing it
 ksym_dep_filter =                                                            \
 	case "$(1)" in                                                       \
-	cc_*_c) $(CPP) $(c_flags) -D__KSYM_DEPS__ $< ;;                      \
-	as_*_S) $(CPP) $(a_flags) -D__KSYM_DEPS__ $< ;;                      \
+	cc_*_c) $(CPP) $(filter-out -Wp$(comma)-M%, $(c_flags)) -D__KSYM_DEPS__ $< ;; \
+	as_*_S) $(CPP) $(filter-out -Wp$(comma)-M%, $(a_flags)) -D__KSYM_DEPS__ $< ;; \
 	cpp_lds_S) : ;;                                                      \
 	*) echo "Don't know how to preprocess $(1)"; false ;;                \
 	esac | sed -rn 's/^.*=== __KSYM_(.*) ===.*$$/KSYM_\1/p'

Michal
