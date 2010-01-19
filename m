Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yx0-f187.google.com ([209.85.210.187]:46215 "EHLO
	mail-yx0-f187.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751471Ab0ASRzT convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 19 Jan 2010 12:55:19 -0500
MIME-Version: 1.0
In-Reply-To: <520f0cf11001190942n2c765618m8a66b8afe82010d0@mail.gmail.com>
References: <1263883920-17289-1-git-send-email-vapier@gentoo.org>
	<20100119142545.GB3473@hack> <8bd0f97a1001190923p6104acb4if5ec7225d549b713@mail.gmail.com>
	<520f0cf11001190942n2c765618m8a66b8afe82010d0@mail.gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 19 Jan 2010 12:54:59 -0500
Message-ID: <8bd0f97a1001190954q62b3bc5ejbdb69684d61c087c@mail.gmail.com>
Subject: Re: [PATCH] kconfig: dont hardcode path to lsmod
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: John Kacur <jkacur@redhat.com>
Cc: =?UTF-8?Q?Am=C3=A9rico_Wang?= <xiyou.wangcong@gmail.com>, Steven Rostedt <srostedt@redhat.com>, linux-kbuild@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org

On Tue, Jan 19, 2010 at 12:42, John Kacur wrote:
> On Tue, Jan 19, 2010 at 6:23 PM, Mike Frysinger wrote:
>> On Tue, Jan 19, 2010 at 09:25, Américo Wang wrote:
>>> On Tue, Jan 19, 2010 at 01:52:00AM -0500, Mike Frysinger wrote:
>>>>The lsmod utility has always been installed into /bin with the newer
>>>>module-init-tools package, so let lsmod be found via PATH instead of
>>>>hardcoding the old modutils /sbin path.
>>>>
>>>
>>> Some distro doesn't set /sbin to PATH, so for me a better solution
>>> would be making PATH contain /sbin, and then use "lsmod".
>>
>> read my changelog -- module-init-tools has always installed into /bin.
>>  so what your distro does with /sbin doesnt matter.
>
> I prefer my patches work for the real-world instead of the "so what
> your distro does doesn't matter" world.

try reading my comment instead of getting huffy.  if you have a distro
that does something stupid like break the correct default m-i-t
install setup, you should actually point it out.  the ones i checked
were sane and installed lsmod into /bin (and some symlinked lsmod for
backwards compat with modutils into /sbin).
-mike
