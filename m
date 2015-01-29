Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:42779 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753472AbbA2NPO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 29 Jan 2015 08:15:14 -0500
Message-ID: <54CA325F.9070906@suse.cz>
Date: Thu, 29 Jan 2015 14:15:11 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH v11 23/28] scripts/gdb: Ignore byte-compiled python files
References: <cover.1422514006.git.jan.kiszka@siemens.com> <fd0c2a6ad6e1d021ce85798f9cd89d9e3381288e.1422514006.git.jan.kiszka@siemens.com>
In-Reply-To: <fd0c2a6ad6e1d021ce85798f9cd89d9e3381288e.1422514006.git.jan.kiszka@siemens.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Kiszka <jan.kiszka@siemens.com>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Wessel <jason.wessel@windriver.com>, kgdb-bugreport@lists.sourceforge.net, Andi Kleen <andi@firstfloor.org>, Tom Tromey <tromey@redhat.com>, Ben Widawsky <ben@bwidawsk.net>, Borislav Petkov <bp@suse.de>, Daniel Thompson <daniel.thompson@linaro.org>, linux-kbuild@vger.kernel.org

On 2015-01-29 07:46, Jan Kiszka wrote:
> --- a/Makefile
> +++ b/Makefile
> @@ -1179,7 +1179,8 @@ MRPROPER_FILES += .config .config.old .version .old_version $(version_h) \
>  		  Module.symvers tags TAGS cscope* GPATH GTAGS GRTAGS GSYMS \
>  		  signing_key.priv signing_key.x509 x509.genkey		\
>  		  extra_certificates signing_key.x509.keyid		\
> -		  signing_key.x509.signer vmlinux-gdb.py
> +		  signing_key.x509.signer vmlinux-gdb.py		\
> +		  scripts/gdb/linux/*.py[co]

In 01/28, you already have

+clean-files := *.pyc $(if $(KBUILD_SRC),*.py)

Maybe just add *.pyo there and you don't need to add it to the toplevel
Makefile.

Michal
