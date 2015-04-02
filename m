Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:60657 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752597AbbDBP1x (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 2 Apr 2015 11:27:53 -0400
Message-ID: <551D5FF5.7070503@suse.cz>
Date: Thu, 02 Apr 2015 17:27:49 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] kbuild: refactor Makefile inclusion
References: <1427456618-23830-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1427456618-23830-1-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org
Cc: linux-mips@linux-mips.org, Tony Luck <tony.luck@intel.com>, x86@kernel.org, linux-ia64@vger.kernel.org, user-mode-linux-devel@lists.sourceforge.net, Jeff Dike <jdike@addtoit.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Russell King <linux@arm.linux.org.uk>, Richard Weinberger <richard@nod.at>, user-mode-linux-user@lists.sourceforge.net, Ingo Molnar <mingo@redhat.com>, Fenghua Yu <fenghua.yu@intel.com>, Ralf Baechle <ralf@linux-mips.org>, linux-arm-kernel@lists.infradead.org

On 2015-03-27 12:43, Masahiro Yamada wrote:
> Masahiro Yamada (4):
>   kbuild: use relative path to include Makefile
>   kbuild: use relative path more to include Makefile
>   kbuild: include $(src)/Makefile rather than $(obj)/Makefile
>   kbuild: ia64: use $(src)/Makefile.gate rather than particular path

Applied to kbuild.git#kbuild.

Michal

