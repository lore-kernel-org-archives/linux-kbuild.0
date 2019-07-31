Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:19894 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726817AbfGaCvM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jul 2019 22:51:12 -0400
MIME-Version: 1.0
References: <20190509143859.9050-1-joe.lawrence@redhat.com> <20190509143859.9050-4-joe.lawrence@redhat.com>
In-Reply-To: <20190509143859.9050-4-joe.lawrence@redhat.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 31 Jul 2019 11:50:19 +0900
Message-ID: <CAK7LNAT3qZ8EESs0eEtaezjgjzRa1XqoAAxpKh_sLi_JPJie2A@mail.gmail.com>
Subject: Re: [PATCH v4 03/10] livepatch: Add klp-convert tool
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joe Lawrence <joe.lawrence@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, live-patching@vger.kernel.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Thu, May 9, 2019 at 11:39 PM Joe Lawrence <joe.lawrence@redhat.com> wrote:
>
> From: Josh Poimboeuf <jpoimboe@redhat.com>
>
> Livepatches may use symbols which are not contained in its own scope,
> and, because of that, may end up compiled with relocations that will
> only be resolved during module load. Yet, when the referenced symbols
> are not exported, solving this relocation requires information on the
> object that holds the symbol (either vmlinux or modules) and its
> position inside the object, as an object may contain multiple symbols
> with the same name. Providing such information must be done
> accordingly to what is specified in
> Documentation/livepatch/module-elf-format.txt.
>
> Currently, there is no trivial way to embed the required information
> as requested in the final livepatch elf object. klp-convert solves
> this problem in two different forms: (i) by relying on Symbols.list,
> which is built during kernel compilation, to automatically infer the
> relocation targeted symbol, and, when such inference is not possible
> (ii) by using annotations in the elf object to convert the relocation
> accordingly to the specification, enabling it to be handled by the
> livepatch loader.
>
> Given the above, create scripts/livepatch to hold tools developed for
> livepatches and add source files for klp-convert there.
>
> The core file of klp-convert is scripts/livepatch/klp-convert.c, which
> implements the heuristics used to solve the relocations and the
> conversion of unresolved symbols into the expected format, as defined
> in [1].
>
> klp-convert receives as arguments the Symbols.list file, an input
> livepatch module to be converted and the output name for the converted
> livepatch. When it starts running, klp-convert parses Symbols.list and
> builds two internal lists of symbols, one containing the exported and
> another containing the non-exported symbols. Then, by parsing the rela
> sections in the elf object, klp-convert identifies which symbols must
> be converted, which are those unresolved and that do not have a
> corresponding exported symbol, and attempts to convert them
> accordingly to the specification.
>
> By using Symbols.list, klp-convert identifies which symbols have names
> that only appear in a single kernel object, thus being capable of
> resolving these cases without the intervention of the developer. When
> various homonymous symbols exist through kernel objects, it is not
> possible to infer the right one, thus klp-convert falls back into
> using developer annotations. If these were not provided, then the tool
> will print a list with all acceptable targets for the symbol being
> processed.
>
> Annotations in the context of klp-convert are accessible as struct
> klp_module_reloc entries in sections named
> .klp.module_relocs.<objname>. These entries are pairs of symbol
> references and positions which are to be resolved against definitions
> in <objname>.
>
> Define the structure klp_module_reloc in
> include/linux/uapi/livepatch.h allowing developers to annotate the
> livepatch source code with it.
>
> klp-convert relies on libelf and on a list implementation. Add files
> scripts/livepatch/elf.c and scripts/livepatch/elf.h, which are a
> libelf interfacing layer and scripts/livepatch/list.h, which is a
> list implementation.
>
> Update Makefiles to correctly support the compilation of the new tool,
> update MAINTAINERS file and add a .gitignore file.
>
> [1] - Documentation/livepatch/module-elf-format.txt
>
> Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
> Signed-off-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
> Signed-off-by: Joao Moreira <jmoreira@suse.de>
> Signed-off-by: Joe Lawrence <joe.lawrence@redhat.com>
> ---
>  MAINTAINERS                     |   1 +
>  include/uapi/linux/livepatch.h  |   5 +
>  scripts/Makefile                |   1 +
>  scripts/livepatch/.gitignore    |   1 +
>  scripts/livepatch/Makefile      |   7 +
>  scripts/livepatch/elf.c         | 753 ++++++++++++++++++++++++++++++++
>  scripts/livepatch/elf.h         |  73 ++++
>  scripts/livepatch/klp-convert.c | 713 ++++++++++++++++++++++++++++++
>  scripts/livepatch/klp-convert.h |  39 ++
>  scripts/livepatch/list.h        | 391 +++++++++++++++++
>  10 files changed, 1984 insertions(+)
>  create mode 100644 scripts/livepatch/.gitignore
>  create mode 100644 scripts/livepatch/Makefile
>  create mode 100644 scripts/livepatch/elf.c
>  create mode 100644 scripts/livepatch/elf.h
>  create mode 100644 scripts/livepatch/klp-convert.c
>  create mode 100644 scripts/livepatch/klp-convert.h
>  create mode 100644 scripts/livepatch/list.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 52842fa37261..c1587e1cc385 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9022,6 +9022,7 @@ F:        arch/x86/kernel/livepatch.c
>  F:     Documentation/livepatch/
>  F:     Documentation/ABI/testing/sysfs-kernel-livepatch
>  F:     samples/livepatch/
> +F:     scripts/livepatch/
>  F:     tools/testing/selftests/livepatch/
>  L:     live-patching@vger.kernel.org
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/livepatching/livepatching.git
> diff --git a/include/uapi/linux/livepatch.h b/include/uapi/linux/livepatch.h
> index e19430918a07..1c364d42d38e 100644
> --- a/include/uapi/linux/livepatch.h
> +++ b/include/uapi/linux/livepatch.h
> @@ -12,4 +12,9 @@
>  #define KLP_RELA_PREFIX                ".klp.rela."
>  #define KLP_SYM_PREFIX         ".klp.sym."
>
> +struct klp_module_reloc {
> +       void *sym;
> +       unsigned int sympos;
> +} __attribute__((packed));
> +
>  #endif /* _UAPI_LIVEPATCH_H */
> diff --git a/scripts/Makefile b/scripts/Makefile
> index 9d442ee050bd..bf9ce74b70b0 100644
> --- a/scripts/Makefile
> +++ b/scripts/Makefile
> @@ -39,6 +39,7 @@ build_unifdef: $(obj)/unifdef
>  subdir-$(CONFIG_GCC_PLUGINS) += gcc-plugins
>  subdir-$(CONFIG_MODVERSIONS) += genksyms
>  subdir-$(CONFIG_SECURITY_SELINUX) += selinux
> +subdir-$(CONFIG_LIVEPATCH)   += livepatch
>
>  # Let clean descend into subdirs
>  subdir-        += basic dtc gdb kconfig mod package
> diff --git a/scripts/livepatch/.gitignore b/scripts/livepatch/.gitignore
> new file mode 100644
> index 000000000000..dc22fe4b6a5b
> --- /dev/null
> +++ b/scripts/livepatch/.gitignore
> @@ -0,0 +1 @@
> +klp-convert
> diff --git a/scripts/livepatch/Makefile b/scripts/livepatch/Makefile
> new file mode 100644
> index 000000000000..2842ecdba3fd
> --- /dev/null
> +++ b/scripts/livepatch/Makefile
> @@ -0,0 +1,7 @@
> +hostprogs-y                    := klp-convert
> +always                         := $(hostprogs-y)
> +
> +klp-convert-objs               := klp-convert.o elf.o
> +
> +HOST_EXTRACFLAGS               := -g -I$(INSTALL_HDR_PATH)/include -Wall

This looks strange.

Theoretically, you cannot include headers in $(INSTALL_HDR_PATH)/include
from host programs.

headers_install works for the target architecture, not host architecture.
This may cause a strange result when you are cross-compiling the kernel.

BTW, which header in $(INSTALL_HDR_PATH)/include do you need to include ?


Also, -Wall is redundant because it is set by the top-level Makefile.

-- 
Best Regards
Masahiro Yamada
