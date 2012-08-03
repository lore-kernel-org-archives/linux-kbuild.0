Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:45204 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753876Ab2HCMs2 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 3 Aug 2012 08:48:28 -0400
Date: Fri, 3 Aug 2012 20:48:19 +0800
From: Fengguang Wu <fengguang.wu@intel.com>
Subject: Re: [ashishki:rtit-dummy 2/5] make[4]: *** No rule to make target
 `../../include/asm/cpufeature.h', needed by
 `arch/x86/kernel/cpu/capflags.c'.
Message-ID: <20120803124819.GA19600@localhost>
References: <20120803120119.GA18460@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20120803120119.GA18460@localhost>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel-janitors@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>

On Fri, Aug 03, 2012 at 08:01:19PM +0800, Fengguang Wu wrote:
> Hi Alexander,
> 
> Kernel build failed on
> 
> tree:   git://otcgit.jf.intel.com/ashishki/linux.git rtit-dummy
> head:   b51a58282492b3739c667d673aacee9bc35c1e3f
> commit: 57f5876423d5763a25e5a4333a3b3783c49e6628 [2/5] x86: first shot at RTIT driver
> config: i386-randconfig-b031 (attached as .config)
> 
> Build errors:
> 
> make[4]: *** No rule to make target `../../include/asm/cpufeature.h', needed by `arch/x86/kernel/cpu/capflags.c'.
> make[4]: *** No rule to make target `mkcapflags.pl', needed by `arch/x86/kernel/cpu/capflags.c'.

The patch manages to block the build system like this:

/*
 *  kbuild-i386 ashishki/rtit-dummy [4/5] be536bf (69 minutes ago)  2012-08-03 18:38  00:00:03 / 1 = 3s
 */
[3 weeks ago, Alexander Shishkin] interim

2798 real  1343 user  1043 sys  85.29% cpu      i386-randconfig-k025
3324 real  1524 user  1326 sys  85.74% cpu      i386-randconfig-k029
6734 real  3087 user  2588 sys  84.26% cpu      i386-randconfig-k023

^C%
init-+-2*[make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---m+
     |-2*[make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---m+
     |-make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make+
     |-make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make+
     |-make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make+
     |-make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make+
     |-make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make+
     |-2*[make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---m+
     |-make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make+
     |-make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make+
     |-make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make+
     |-2*[make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---m+
     |-make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make+
     |-make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make+
     |-make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make+
     |-2*[make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---m+
     |-make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make+
     |-2*[make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---m+
     |-make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make+
     |-make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make+
     |-make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make+
     |-make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make+
     |-make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make+
     |-2*[make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---m+
     |-2*[make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---m+
     |-make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make+
     |-2*[make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---m+
     |-make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make---make+
[cut off hundreds of more lines]

Thanks,
Fengguang
