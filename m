Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.cn.fujitsu.com ([183.91.158.132]:51165 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1750866AbdKJIpr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 Nov 2017 03:45:47 -0500
Subject: Re: [PATCH 3/4] kbuild: create object directories simpler and faster
References: <1510242077-8122-1-git-send-email-yamada.masahiro@socionext.com>
 <1510242077-8122-4-git-send-email-yamada.masahiro@socionext.com>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <f036cb4e-d8e3-28d9-966e-14d6eb3599cf@cn.fujitsu.com>
Date: Fri, 10 Nov 2017 16:45:39 +0800
MIME-Version: 1.0
In-Reply-To: <1510242077-8122-4-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Douglas Anderson <dianders@chromium.org>, Michal Marek <mmarek@suse.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Lutomirski <luto@amacapital.net>, Ingo Molnar <mingo@redhat.com>

Hi Masahiro-san,

On 11/09/2017 11:41 PM, Masahiro Yamada wrote:
> For the out-of-tree build, scripts/Makefile.build creates output
> directories, but this operation is not efficient.
> 
> scripts/Makefile.lib calculates obj-dirs as follows:
> 
>   obj-dirs := $(dir $(multi-objs) $(obj-y))
> 
> Please notice $(sort ...) is not used here.  Usually the resulted
> obj-dirs is as many "./" as objects.
> 
> For those duplicated paths, the following command is invoked.
> 
>   _dummy := $(foreach d,$(obj-dirs), $(shell [ -d $(d) ] || mkdir -p $(d)))
> 
> Then, the costly shell command is run over and over again.
> 
> I see many points for optimization:
> 
> [1] Use $(sort ...) to cut down duplicated paths before passing them
>     to system call
> [2] Use single $(shell ...) instead of repeating it with $(foreach ...)
>     This will reduce forking.
> [3] We can calculate obj-dirs more simply.  Most of objects are already
>     accumulated in $(targets).  So, $(dir $(targets)) is fine and more
>     comprehensive.
> 
> I also removed bad code in arch/x86/entry/vdso/Makefile.  This is now
> really unnecessary.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  arch/x86/entry/vdso/Makefile |  4 ----
>  scripts/Makefile.build       | 15 ++++++---------
>  scripts/Makefile.host        | 11 -----------
>  scripts/Makefile.lib         |  5 -----
>  4 files changed, 6 insertions(+), 29 deletions(-)
> 
> diff --git a/arch/x86/entry/vdso/Makefile b/arch/x86/entry/vdso/Makefile
> index d540966..f8e3d85 100644
> --- a/arch/x86/entry/vdso/Makefile
> +++ b/arch/x86/entry/vdso/Makefile
> @@ -129,10 +129,6 @@ $(obj)/vdsox32.so.dbg: $(src)/vdsox32.lds $(vobjx32s) FORCE
>  CPPFLAGS_vdso32.lds = $(CPPFLAGS_vdso.lds)
>  VDSO_LDFLAGS_vdso32.lds = -m32 -Wl,-m,elf_i386 -Wl,-soname=linux-gate.so.1
>  
> -# This makes sure the $(obj) subdirectory exists even though vdso32/
> -# is not a kbuild sub-make subdirectory.
> -override obj-dirs = $(dir $(obj)) $(obj)/vdso32/
> -
>  targets += vdso32/vdso32.lds
>  targets += vdso32/note.o vdso32/system_call.o vdso32/sigreturn.o
>  targets += vdso32/vclock_gettime.o
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 62d5314..89ac180 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -64,15 +64,6 @@ ifneq ($(hostprogs-y)$(hostprogs-m)$(hostlibs-y)$(hostlibs-m)$(hostcxxlibs-y)$(h
>  include scripts/Makefile.host
>  endif
>  
> -ifneq ($(KBUILD_SRC),)
> -# Create output directory if not already present
> -_dummy := $(shell [ -d $(obj) ] || mkdir -p $(obj))
> -
> -# Create directories for object files if directory does not exist
> -# Needed when obj-y := dir/file.o syntax is used
> -_dummy := $(foreach d,$(obj-dirs), $(shell [ -d $(d) ] || mkdir -p $(d)))
> -endif
> -
>  ifndef obj
>  $(warning kbuild: Makefile.build is included improperly)
>  endif
> @@ -589,6 +580,12 @@ ifneq ($(cmd_files),)
>    include $(cmd_files)
>  endif
>  
> +ifneq ($(KBUILD_SRC),)
> +# Create directories for object files if directory does not exist
> +obj-dirs := $(sort $(obj) $(patsubst %/,%, $(dir $(targets))))
> +$(shell mkdir -p $(obj-dirs))
> +endif
> +

I just take a quick glance: is "$(obj)" here necessary? I think all
$(targets) are under directory $(obj) when we descend into $(obj) to
recursive make, if I don't miss anything.

-- 
Sincerely,
Cao jin

>  # Declare the contents of the .PHONY variable as phony.  We keep that
>  # information in a variable se we can use it in if_changed and friends.
>  
> diff --git a/scripts/Makefile.host b/scripts/Makefile.host
> index 9cfd5c8..3a5460d 100644
> --- a/scripts/Makefile.host
> +++ b/scripts/Makefile.host
> @@ -48,15 +48,6 @@ host-cxxobjs	:= $(sort $(foreach m,$(host-cxxmulti),$($(m)-cxxobjs)))
>  host-cshobjs	:= $(sort $(foreach m,$(host-cshlib),$($(m:.so=-objs))))
>  host-cxxshobjs	:= $(sort $(foreach m,$(host-cxxshlib),$($(m:.so=-objs))))
>  
> -# output directory for programs/.o files
> -# hostprogs-y := tools/build may have been specified.
> -# Retrieve also directory of .o files from prog-objs or prog-cxxobjs notation
> -host-objdirs := $(dir $(__hostprogs) $(host-cobjs) $(host-cxxobjs))
> -
> -host-objdirs := $(strip $(sort $(filter-out ./,$(host-objdirs))))
> -
> -
> -__hostprogs     := $(addprefix $(obj)/,$(__hostprogs))
>  host-csingle	:= $(addprefix $(obj)/,$(host-csingle))
>  host-cmulti	:= $(addprefix $(obj)/,$(host-cmulti))
>  host-cobjs	:= $(addprefix $(obj)/,$(host-cobjs))
> @@ -68,8 +59,6 @@ host-cshobjs	:= $(addprefix $(obj)/,$(host-cshobjs))
>  host-cxxshobjs	:= $(addprefix $(obj)/,$(host-cxxshobjs))
>  host-objdirs    := $(addprefix $(obj)/,$(host-objdirs))
>  
> -obj-dirs += $(host-objdirs)
> -
>  #####
>  # Handle options to gcc. Support building with separate output directory
>  
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 4d88ad7..5fbc46d 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -50,15 +50,11 @@ single-used-m := $(sort $(filter-out $(multi-used-m),$(obj-m)))
>  # objects depend on those (obviously)
>  multi-objs-y := $(foreach m, $(multi-used-y), $($(m:.o=-objs)) $($(m:.o=-y)))
>  multi-objs-m := $(foreach m, $(multi-used-m), $($(m:.o=-objs)) $($(m:.o=-y)))
> -multi-objs   := $(multi-objs-y) $(multi-objs-m)
>  
>  # $(subdir-obj-y) is the list of objects in $(obj-y) which uses dir/ to
>  # tell kbuild to descend
>  subdir-obj-y := $(filter %/built-in.o, $(obj-y))
>  
> -# $(obj-dirs) is a list of directories that contain object files
> -obj-dirs := $(dir $(multi-objs) $(obj-y))
> -
>  # Replace multi-part objects by their individual parts, look at local dir only
>  real-objs-y := $(foreach m, $(filter-out $(subdir-obj-y), $(obj-y)), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y))),$($(m:.o=-objs)) $($(m:.o=-y)),$(m))) $(extra-y)
>  real-objs-m := $(foreach m, $(obj-m), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m))),$($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m)),$(m)))
> @@ -81,7 +77,6 @@ multi-used-m	:= $(addprefix $(obj)/,$(multi-used-m))
>  multi-objs-y	:= $(addprefix $(obj)/,$(multi-objs-y))
>  multi-objs-m	:= $(addprefix $(obj)/,$(multi-objs-m))
>  subdir-ym	:= $(addprefix $(obj)/,$(subdir-ym))
> -obj-dirs	:= $(addprefix $(obj)/,$(obj-dirs))
>  
>  # These flags are needed for modversions and compiling, so we define them here
>  # $(modname_flags) defines KBUILD_MODNAME as the name of the module it will
> 



