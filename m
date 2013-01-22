Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from david.siemens.de ([192.35.17.14]:32452 "EHLO david.siemens.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752525Ab3AVIpQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Jan 2013 03:45:16 -0500
Message-ID: <50FE5157.7070309@siemens.com>
Date: Tue, 22 Jan 2013 09:44:07 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
MIME-Version: 1.0
Subject: Re: [PATCH v4 00/13] Add gdb python scripts as kernel debugging helpers
References: <cover.1358787929.git.jan.kiszka@siemens.com> <20130121221558.GS30577@one.firstfloor.org>
In-Reply-To: <20130121221558.GS30577@one.firstfloor.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>, "kgdb-bugreport@lists.sourceforge.net" <kgdb-bugreport@lists.sourceforge.net>, Tom Tromey <tromey@redhat.com>, Ben Widawsky <ben@bwidawsk.net>, "David S. Miller" <davem@davemloft.net>, Fenghua Yu <fenghua.yu@intel.com>, Kay Sievers <kay@vrfy.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Tony Luck <tony.luck@intel.com>

On 2013-01-21 23:15, Andi Kleen wrote:
>>
>>  o Install that kernel on the guest
> 
> If you use a static kernel you can also do 
> 
> - copy the initrd out of the guest once
> 
> qemu...  -bzImage kernel -initrd initrd

-kernel/append/initrd, of course.

> 
> This saves the step of getting the kernel into the kernel.
> Doesn't work with modules unfortunately.

True. An alternative can be nfsroot. Or root on virtfs.

Jan

-- 
Siemens AG, Corporate Technology, CT RTC ITP SDP-DE
Corporate Competence Center Embedded Linux
