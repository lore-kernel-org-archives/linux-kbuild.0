Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gw0-f46.google.com ([74.125.83.46]:62911 "EHLO
	mail-gw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755914Ab0JDNrc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 4 Oct 2010 09:47:32 -0400
MIME-Version: 1.0
In-Reply-To: <4CA9D97A.7020109@suse.cz>
References: <AANLkTinwXj92VLVYqDhvUAusY_MdBQPAYnGBKVgfNLrO@mail.gmail.com>
	<20100924093206.GD5453@cr0.nay.redhat.com>
	<AANLkTi=ykH+gTujw+x1c107V6wXfZUT66uHBQ1o6NgK+@mail.gmail.com>
	<4CA9D97A.7020109@suse.cz>
Date: Mon, 4 Oct 2010 14:47:26 +0100
Message-ID: <AANLkTinp4TfW4DecdZJ7X_mSjSqwO0UMmr64v9-27YSX@mail.gmail.com>
Subject: Re: [PATCH] kconfig: Use PATH_MAX instead of 128 for path buffer sizes.
From: Will Newton <will.newton@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: =?ISO-8859-1?Q?Am=E9rico_Wang?= <xiyou.wangcong@gmail.com>, Linux Kernel list <linux-kernel@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org

On Mon, Oct 4, 2010 at 2:41 PM, Michal Marek <mmarek@suse.cz> wrote:
> On 4.10.2010 15:00, Will Newton wrote:
>> On Fri, Sep 24, 2010 at 10:32 AM, Américo Wang <xiyou.wangcong@gmail.com> wrote:
>>> On Wed, Sep 22, 2010 at 03:59:13PM +0100, Will Newton wrote:
>>>> This prevents the buffers being overflowed when using a config
>>>> file with a long name. PATH_MAX is used elsewhere in the same
>>>> file, so use it here as well.
>>>>
>>>> Signed-off-by: Will Newton <will.newton@imgtec.com>
>>>
>>> Acked-by: WANG Cong <xiyou.wangcong@gmail.com>
>>>
>>> Thanks!
>>
>> Ping!
>>
>> Could someone take this please?
>
> Sorry, applied now. BTW, please do not send patches inline _and_ as
> attachments at the same time, it confuses git am.

Thanks!

The reason I send the patches in both ways is because last time I
checked the gmail web interface will mangle an inline patch, but not
an attached one, and most people like an inline patch for review
purposes. I'll have to check to see if there's another way to avo
