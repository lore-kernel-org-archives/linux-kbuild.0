Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:58480 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752419Ab1KTSFR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 20 Nov 2011 13:05:17 -0500
Received: by eye27 with SMTP id 27so4729758eye.19
        for <linux-kbuild@vger.kernel.org>; Sun, 20 Nov 2011 10:05:16 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4EC8F907.4060906@suse.cz>
References: <1321567131.25715.32.camel@work-vm>
	<4EC8F907.4060906@suse.cz>
Date: Sun, 20 Nov 2011 13:05:16 -0500
Message-ID: <CACqU3MUyHgLfLohLKQQV4+WKhpwW3xiS5hM51xtngs1pWUL9pg@mail.gmail.com>
Subject: Re: [PATCH] kconfig: Add merge_config.sh script
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: john stultz <johnstul@us.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, gthelen@google.com, tartler@cs.fau.de, Dmitry Fink <Dmitry.Fink@palm.com>, Darren Hart <dvhart@linux.intel.com>, Eric B Munson <ebmunson@us.ibm.com>, Bruce Ashfield <Bruce.Ashfield@windriver.com>, linux-kbuild@vger.kernel.org

Hi,

On Sun, Nov 20, 2011 at 7:56 AM, Michal Marek <mmarek@suse.cz> wrote:
> On 17.11.2011 22:58, john stultz wrote:
>> Hey Andrew,
>>       I've tried sending this via Michal a few times, but haven't heard much
>> back. So I wanted to check if you would consider merging it via your
>> tree, or if you had any suggestions of who would be better to
>> review/merge this.
>
> My concern was that the script works around missing features in kconfig,
> instead of fixing kconfig. Don't get me wrong, I do believe that the
> script is useful, but if you are submitting to mainline anyway, why
> don't you fix/enhance kconfig in mainline and have a much simpler script
> making use of the enhanced kconfig?
>
FWIW, as much as I agree with you, kconfig is currently a bit too
static, with too much assumption, do any advanced stuff. I have WIP in
the area, but I prefer not giving ETA. In the mean time, I think
John's script could fill the gap.

 - Arnaud
