Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:64718 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750793Ab0HRFhD convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Aug 2010 01:37:03 -0400
MIME-Version: 1.0
In-Reply-To: <4C6A2FC2.9050908@suse.cz>
References: <1281592579-343-1-git-send-email-vapier@gentoo.org>
 <20100817054640.GD5095@cr0.nay.redhat.com> <4C6A2FC2.9050908@suse.cz>
From: Mike Frysinger <vapier@gentoo.org>
Date: Wed, 18 Aug 2010 01:36:41 -0400
Message-ID: <AANLkTi=nadv1Cu2azb3arh6M_Of6cVN1RXONwoHb7pf1@mail.gmail.com>
Subject: Re: [PATCH] kconfig: fix warnings in fgets/fwrite usage
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: =?UTF-8?Q?Am=C3=A9rico_Wang?= <xiyou.wangcong@gmail.com>, linux-kbuild@vger.kernel.org, Roman Zippel <zippel@linux-m68k.org>, linux-kernel@vger.kernel.org

On Tue, Aug 17, 2010 at 02:44, Michal Marek wrote:
> On 17.8.2010 07:46, Américo Wang wrote:
>> On Thu, Aug 12, 2010 at 01:56:19AM -0400, Mike Frysinger wrote:
>>> Add some helper functions that abort on failure, and change the fwrite
>>> and fget calls to use those.  This should kill off all the ugly gcc
>>> warnings that some distros emit about ignoring return values due to
>>> usage of warn_unused_result attributes.
>>>
>>> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
>>
>> Looks good to me,
>>
>> Acked-by: WANG Cong <xiyou.wangcong@gmail.com>
>
> I already merged similar patches by Jean Sacren, see commits bf5e327 and
> 4418a2b in kbuild-2.6.git.

guess i should have posted the patches when i wrote them (March).  oh
well, as long as it's fixed ;).
-mike
