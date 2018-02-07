Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:5014 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753675AbeBGLv7 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Feb 2018 06:51:59 -0500
Date: Wed, 7 Feb 2018 19:57:59 +0800
From: Philip Li <philip.li@intel.com>
Subject: Re: [kbuild-all] [kbuild:kbuild 1/11]
 arch/x86/tools/insn_decoder_test: warning: ffffffff81105f01: 0f ff 80 3d 6e
 be 36 ud0 0x36be6e3d(%rax), %eax
Message-ID: <20180207115759.GA28090@intel.com>
References: <201802071838.d9iEK6bt%fengguang.wu@intel.com>
 <CAK7LNASGb_rU1TSSODArs+LVybYM0OTo1imFp5AP2ZAxy_82YQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASGb_rU1TSSODArs+LVybYM0OTo1imFp5AP2ZAxy_82YQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: kbuild test robot <fengguang.wu@intel.com>, Ulf Magnusson <ulfalizer@gmail.com>, kbuild-all@01.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Wed, Feb 07, 2018 at 07:30:03PM +0900, Masahiro Yamada wrote:
> Hi test robot,
> 
> 
> 2018-02-07 19:10 GMT+09:00 kbuild test robot <fengguang.wu@intel.com>:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
> > head:   0a5f41767444cc3b4fc5573921ab914b4f78baaa
> > commit: e9829ac4e5fdf3978d761f2f1b13f19a468cac97 [1/11] video: fbdev: kconfig: Remove blank help text
> > config: x86_64-rhel-7.2 (attached as .config)
> > compiler: gcc-7 (Debian 7.3.0-1) 7.3.0
> > reproduce:
> >         git checkout e9829ac4e5fdf3978d761f2f1b13f19a468cac97
> >         # save the attached .config to linux build tree
> >         make ARCH=x86_64
> 
> 
> 
> I believe this is false-positive.
sorry for the noise, this is a false positive. We will investigate this, which
is probably related to latest upgrade to gcc 7.3.

> 
> This commit removed unnecessary 'help' from Kconfig.  That's all.
> 
> 
> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> index 2566cfb..f9058c4 100644
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -1156,7 +1156,6 @@ config FB_I810_I2C
>         bool "Enable DDC Support"
>         depends on FB_I810 && FB_I810_GTF
>         select FB_DDC
> -       help
> 
>  config FB_LE80578
>         tristate "Intel LE80578 (Vermilion) support"
> 
> 
> 
> 
> 
> 
> 
> 
> > All warnings (new ones prefixed by >>):
> >
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff810f6dbd: 0f ff e9                ud0    %ecx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff810f72bd: 0f ff e9                ud0    %ecx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff810f8164: 0f ff eb                ud0    %ebx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff810f8245: 0f ff e9                ud0    %ecx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff810f8267: 0f ff 48 8b             ud0    -0x75(%rax),%ecx
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 4 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff810f83ac: 0f ff e9                ud0    %ecx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff810f8546: 0f ff e9                ud0    %ecx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff810f87c5: 0f ff c3                ud0    %ebx,%eax
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff810f935e: 0f ff eb                ud0    %ebx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff810f941a: 0f ff e9                ud0    %ecx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff810f9f5d: 0f ff e9                ud0    %ecx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff810fa00f: 0f ff e9                ud0    %ecx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff810fb4f3: 0f ff 44 8b 53          ud0    0x53(%rbx,%rcx,4),%eax
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 5 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff810fdb0d: 0f ff eb                ud0    %ebx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff810fe523: 0f ff e9                ud0    %ecx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff810fe963: 0f ff bd ea ff ff ff    ud0    -0x16(%rbp),%edi
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 7 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff810fea45: 0f ff 48 8b             ud0    -0x75(%rax),%ecx
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 4 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff810ffbc8: 0f ff 65 48             ud0    0x48(%rbp),%esp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 4 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff810ffd02: 0f ff 48 89             ud0    -0x77(%rax),%ecx
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 4 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff811005e0: 0f ff e9                ud0    %ecx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff811005f4: 0f ff eb                ud0    %ebx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff81100f5c: 0f ff e9                ud0    %ecx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff811010f3: 0f ff e9                ud0    %ecx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff81101368: 0f ff e9                ud0    %ecx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff81101f1a: 0f ff 48 85             ud0    -0x7b(%rax),%ecx
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 4 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff8110305d: 0f ff 45 31             ud0    0x31(%rbp),%eax
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 4 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff81103570: 0f ff eb                ud0    %ebx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff811037f2: 0f ff eb                ud0    %ebx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff81103832: 0f ff eb                ud0    %ebx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff811038db: 0f ff 48 83             ud0    -0x7d(%rax),%ecx
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 4 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff8110390b: 0f ff 8b 54 24 04 eb    ud0    -0x14fbdbac(%rbx),%ecx
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 7 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff81104bb9: 0f ff 48 8b             ud0    -0x75(%rax),%ecx
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 4 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff8110551c: 0f ff e9                ud0    %ecx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >>> arch/x86/tools/insn_decoder_test: warning: ffffffff81105f01: 0f ff 80 3d 6e be 36    ud0    0x36be6e3d(%rax),%eax
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 7 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff81106197: 0f ff eb                ud0    %ebx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff8110676a: 0f ff eb                ud0    %ebx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff81106b2f: 0f ff e9                ud0    %ecx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff81107097: 0f ff eb                ud0    %ebx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff81107131: 0f ff 5b c3             ud0    -0x3d(%rbx),%ebx
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 4 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff81107135: 0f ff 5b c3             ud0    -0x3d(%rbx),%ebx
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 4 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff81107160: 0f ff 5b c3             ud0    -0x3d(%rbx),%ebx
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 4 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff811074af: 0f ff e9                ud0    %ecx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff8110750b: 0f ff c3                ud0    %ebx,%eax
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff81107560: 0f ff c3                ud0    %ebx,%eax
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff811079e2: 0f ff 48 89             ud0    -0x77(%rax),%ecx
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 4 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff81107a02: 0f ff e9                ud0    %ecx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff81108096: 0f ff e9                ud0    %ecx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff811082d0: 0f ff e9                ud0    %ecx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff81108c5f: 0f ff e9                ud0    %ecx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff81108d73: 0f ff e9                ud0    %ecx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff81108dc9: 0f ff e9                ud0    %ecx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff8110902f: 0f ff e9                ud0    %ecx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff81109052: 0f ff eb                ud0    %ebx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff81109056: 0f ff e9                ud0    %ecx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff811094b4: 0f ff e9                ud0    %ecx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff81109749: 0f ff 49 8d             ud0    -0x73(%rcx),%ecx
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 4 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff81109a80: 0f ff e9                ud0    %ecx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff81109d10: 0f ff e9                ud0    %ecx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff8110a7ee: 0f ff 41 bd             ud0    -0x43(%rcx),%eax
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 4 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff8110a8b7: 0f ff e9                ud0    %ecx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff8110b007: 0f ff eb                ud0    %ebx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff8110b043: 0f ff 49 c7             ud0    -0x39(%rcx),%ecx
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 4 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff8110b066: 0f ff eb                ud0    %ebx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff8110b11b: 0f ff eb                ud0    %ebx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff8110b210: 0f ff eb                ud0    %ebx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff8110b24e: 0f ff 8b 46 18 a8 01    ud0    0x1a81846(%rbx),%ecx
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 7 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff8110b53d: 0f ff eb                ud0    %ebx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> > --
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff81419474: 0f ff 4c 8b 5c          ud0    0x5c(%rbx,%rcx,4),%ecx
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 5 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff8141a8e9: 0f ff eb                ud0    %ebx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff8141aa0b: 0f ff e9                ud0    %ecx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff8141acac: 0f ff 48 83             ud0    -0x7d(%rax),%ecx
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 4 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff8141ad8a: 0f ff 48 8b             ud0    -0x75(%rax),%ecx
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 4 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff8141ce75: 0f ff eb                ud0    %ebx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff8141cfa5: 0f ff eb                ud0    %ebx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff8141d010: 0f ff eb                ud0    %ebx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff8141d0eb: 0f ff 89 d8 5b c3 89    ud0    -0x763ca428(%rcx),%ecx
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 7 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff8141d881: 0f ff eb                ud0    %ebx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff8141e987: 0f ff c3                ud0    %ebx,%eax
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff8141f097: 0f ff 48 89             ud0    -0x77(%rax),%ecx
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 4 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff8141f2f0: 0f ff 5b 5d             ud0    0x5d(%rbx),%ebx
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 4 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff8141f32c: 0f ff 5b 5d             ud0    0x5d(%rbx),%ebx
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 4 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff814226b6: 0f ff 31                ud0    (%rcx),%esi
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff814226cd: 0f ff 31                ud0    (%rcx),%esi
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff814226e7: 0f ff 31                ud0    (%rcx),%esi
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff8142273e: 0f ff 31                ud0    (%rcx),%esi
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff81422752: 0f ff 31                ud0    (%rcx),%esi
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff81422769: 0f ff 31                ud0    (%rcx),%esi
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff8142277a: 0f ff 31                ud0    (%rcx),%esi
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff814235a0: 0f ff 48 89             ud0    -0x77(%rax),%ecx
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 4 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff814320f3: 0f ff eb                ud0    %ebx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff81432afa: 0f ff 48 83             ud0    -0x7d(%rax),%ecx
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 4 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff81434d74: 0f ff e9                ud0    %ecx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff81434df6: 0f ff 4c 8b ab          ud0    -0x55(%rbx,%rcx,4),%ecx
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 5 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff8143c961: 0f ff eb                ud0    %ebx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff8143c9ca: 0f ff eb                ud0    %ebx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff8143ca3a: 0f ff eb                ud0    %ebx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff8143ca97: 0f ff 48 c7             ud0    -0x39(%rax),%ecx
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 4 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff8143cf02: 0f ff 48 c7             ud0    -0x39(%rax),%ecx
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 4 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff8143d44c: 0f ff 31                ud0    (%rcx),%esi
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff8143d5ab: 0f ff eb                ud0    %ebx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >>> arch/x86/tools/insn_decoder_test: warning: ffffffff8143e265: 0f ff c3                ud0    %ebx,%eax
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >>> arch/x86/tools/insn_decoder_test: warning: ffffffff8143e291: 0f ff c3                ud0    %ebx,%eax
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >>> arch/x86/tools/insn_decoder_test: warning: ffffffff8143ee4f: 0f ff 48 c7             ud0    -0x39(%rax),%ecx
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 4 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >>> arch/x86/tools/insn_decoder_test: warning: ffffffff8143f4e2: 0f ff 48 8b             ud0    -0x75(%rax),%ecx
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 4 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >>> arch/x86/tools/insn_decoder_test: warning: ffffffff8143f9ac: 0f ff b8 e4 ff ff ff    ud0    -0x1c(%rax),%edi
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 7 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >>> arch/x86/tools/insn_decoder_test: warning: ffffffff8143fa77: 0f ff b8 e4 ff ff ff    ud0    -0x1c(%rax),%edi
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 7 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >>> arch/x86/tools/insn_decoder_test: warning: ffffffff8143ff93: 0f ff 45 31             ud0    0x31(%rbp),%eax
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 4 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >>> arch/x86/tools/insn_decoder_test: warning: ffffffff81442719: 0f ff 48 8b             ud0    -0x75(%rax),%ecx
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 4 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >>> arch/x86/tools/insn_decoder_test: warning: ffffffff81442aa0: 0f ff 48 8b             ud0    -0x75(%rax),%ecx
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 4 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >>> arch/x86/tools/insn_decoder_test: warning: ffffffff81443edc: 0f ff 48 83             ud0    -0x7d(%rax),%ecx
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 4 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >    arch/x86/tools/insn_decoder_test: warning: ffffffff81443f1c: 0f ff 48 83             ud0    -0x7d(%rax),%ecx
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 4 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >>> arch/x86/tools/insn_decoder_test: warning: ffffffff81443f5e: 0f ff 48 83             ud0    -0x7d(%rax),%ecx
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 4 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >>> arch/x86/tools/insn_decoder_test: warning: ffffffff8144482e: 0f ff 48 8b             ud0    -0x75(%rax),%ecx
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 4 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >>> arch/x86/tools/insn_decoder_test: warning: ffffffff8144582c: 0f ff 31                ud0    (%rcx),%esi
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >>> arch/x86/tools/insn_decoder_test: warning: ffffffff814458d0: 0f ff 48 8b             ud0    -0x75(%rax),%ecx
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 4 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >>> arch/x86/tools/insn_decoder_test: warning: ffffffff81445c61: 0f ff c3                ud0    %ebx,%eax
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >>> arch/x86/tools/insn_decoder_test: warning: ffffffff814469be: 0f ff eb                ud0    %ebx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >>> arch/x86/tools/insn_decoder_test: warning: ffffffff81446a44: 0f ff eb                ud0    %ebx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >>> arch/x86/tools/insn_decoder_test: warning: ffffffff81446b97: 0f ff eb                ud0    %ebx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >>> arch/x86/tools/insn_decoder_test: warning: ffffffff81446beb: 0f ff eb                ud0    %ebx,%ebp
> >    arch/x86/tools/insn_decoder_test: warning: objdump says 3 bytes, but insn_get_length() says 2
> >    arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> >
> > ---
> > 0-DAY kernel test infrastructure                Open Source Technology Center
> > https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
> 
> 
> 
> -- 
> Best Regards
> Masahiro Yamada
> _______________________________________________
> kbuild-all mailing list
> kbuild-all@lists.01.org
> https://lists.01.org/mailman/listinfo/kbuild-all
