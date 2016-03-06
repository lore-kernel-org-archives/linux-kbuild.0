Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qg0-f54.google.com ([209.85.192.54]:35582 "EHLO
	mail-qg0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751132AbcCFGUR (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 6 Mar 2016 01:20:17 -0500
Received: by mail-qg0-f54.google.com with SMTP id y89so74698338qge.2
        for <linux-kbuild@vger.kernel.org>; Sat, 05 Mar 2016 22:20:16 -0800 (PST)
Date: Sun, 6 Mar 2016 13:20:13 +0700 (ICT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH v5 5/8] kbuild: add fine grained build dependencies for
 exported symbols
In-Reply-To: <alpine.LFD.2.20.1603052129260.29276@knanqh.ubzr>
Message-ID: <alpine.LFD.2.20.1603061314500.6284@knanqh.ubzr>
References: <1457070050-1564-1-git-send-email-nicolas.pitre@linaro.org> <1457070050-1564-6-git-send-email-nicolas.pitre@linaro.org> <56DA118E.20106@suse.com> <56DA1201.9010605@suse.cz> <20160305071208.GA25757@pobox.suse.cz>
 <alpine.LFD.2.20.1603052129260.29276@knanqh.ubzr>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 5 Mar 2016, Nicolas Pitre wrote:

> On Sat, 5 Mar 2016, Michal Marek wrote:
> 
> > I reproduced the SIGBUS after a few iterations, and it crashes in
> > parse_dep_file(). I'm now testing this
> > 
> > diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> > index 0be7e09ba381..4fdd8348acf6 100644
> > --- a/scripts/Kbuild.include
> > +++ b/scripts/Kbuild.include
> > @@ -270,10 +270,12 @@ else
> >  
> >  # Filter out exported kernel symbol names from the preprocessor output.
> >  # See also __KSYM_DEPS__ in include/linux/export.h.
> > +# We disable the depfile generation here, so as not to overwrite the existing
> > +# depfile while fixdep is parsing it
> >  ksym_dep_filter =                                                            \
> >  	case "$(1)" in                                                       \
> > -	cc_*_c) $(CPP) $(c_flags) -D__KSYM_DEPS__ $< ;;                      \
> > -	as_*_S) $(CPP) $(a_flags) -D__KSYM_DEPS__ $< ;;                      \
> > +	cc_*_c) $(CPP) $(filter-out -Wp$(comma)-M%, $(c_flags)) -D__KSYM_DEPS__ $< ;; \
> > +	as_*_S) $(CPP) $(filter-out -Wp$(comma)-M%, $(a_flags)) -D__KSYM_DEPS__ $< ;; \
> >  	cpp_lds_S) : ;;                                                      \
> >  	*) echo "Don't know how to preprocess $(1)"; false ;;                \
> >  	esac | sed -rn 's/^.*=== __KSYM_(.*) ===.*$$/KSYM_\1/p'
> 
> This makes perfect sense even if I can't reproduce on my side.

I folded the following patch into my tree and pushed it out.

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 0be7e09ba3..2c14a27e39 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -270,14 +270,17 @@ else
 
 # Filter out exported kernel symbol names from the preprocessor output.
 # See also __KSYM_DEPS__ in include/linux/export.h.
+# We disable the depfile generation here, so as not to overwrite the existing
+# depfile while fixdep is parsing it
+flags_nodeps = $(filter-out -Wp$(comma)-M%, $($(1)))
 ksym_dep_filter =                                                            \
 	case "$(1)" in                                                       \
-	cc_*_c) $(CPP) $(c_flags) -D__KSYM_DEPS__ $< ;;                      \
-	as_*_S) $(CPP) $(a_flags) -D__KSYM_DEPS__ $< ;;                      \
+	cc_*_c) $(CPP) $(call flags_nodeps,c_flags) -D__KSYM_DEPS__ $< ;;    \
+	as_*_S) $(CPP) $(call flags_nodeps,a_flags) -D__KSYM_DEPS__ $< ;;    \
 	cpp_lds_S) : ;;                                                      \
-	*) echo "Don't know how to preprocess $(1)"; false ;;                \
+	*) echo "Don't know how to preprocess $(1)" >&2; false ;;            \
 	esac | sed -rn 's/^.*=== __KSYM_(.*) ===.*$$/KSYM_\1/p'
-	
+
 cmd_and_fixdep =                                                             \
 	$(echo-cmd) $(cmd_$(1));                                             \
 	$(ksym_dep_filter) |                                                 \

Nicolas

