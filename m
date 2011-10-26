Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from oproxy8-pub.bluehost.com ([69.89.22.20]:44111 "HELO
	oproxy8-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S932953Ab1JZRBF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 26 Oct 2011 13:01:05 -0400
Message-ID: <4EA83CC6.5070105@xenotime.net>
Date: Wed, 26 Oct 2011 10:00:54 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
MIME-Version: 1.0
Subject: Re: [PATCH]: expose FORCE_MAX_ZONEORDER on x86
References: <CAH+fs=_Cb+m8DP2_cj=DAhVo4ygaQ4JFo8rfq9bOkydr_8UafQ@mail.gmail.com>
In-Reply-To: <CAH+fs=_Cb+m8DP2_cj=DAhVo4ygaQ4JFo8rfq9bOkydr_8UafQ@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Marc Leeman <marc.leeman@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On 10/26/11 02:16, Marc Leeman wrote:
> Larger blocks of memory are required for e.g. higher resolution
> capture card drivers; this patch just enables an already available
> configuration option on x86 (it was already exposed on other
> architectures).
> 
> 

Wrong mailing list -- this is an x86 patch, not a kbuild patch.

Please send it to linux-kernel@vger.kernel.org and the X86 maintainers:

X86 ARCHITECTURE (32-BIT AND 64-BIT)
M:	Thomas Gleixner <tglx@linutronix.de>
M:	Ingo Molnar <mingo@redhat.com>
M:	"H. Peter Anvin" <hpa@zytor.com>
M:	x86@kernel.org
T:	git git://git.kernel.org/pub/scm/linux/kernel/git/x86/linux-2.6-x86.git
S:	Maintained
F:	Documentation/x86/
F:	arch/x86/

-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
