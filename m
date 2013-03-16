Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f43.google.com ([74.125.82.43]:43925 "EHLO
	mail-wg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755589Ab3CPLBu convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 16 Mar 2013 07:01:50 -0400
Received: by mail-wg0-f43.google.com with SMTP id e12so3433133wge.10
        for <linux-kbuild@vger.kernel.org>; Sat, 16 Mar 2013 04:01:49 -0700 (PDT)
Date: Sat, 16 Mar 2013 12:01:46 +0100
From: Manolo =?UTF-8?B?RMOtYXo=?= <diaz.manolo@gmail.com>
Subject: Re: PROBLEM: CONFIG_DEFAULT_MESSAGE_LOGLEVEL option seems not to
 work
Message-ID: <20130316120146.298f3064@gmail.com>
In-Reply-To: <5143FB1F.9010509@infradead.org>
References: <20130315225636.2baf75ae@gmail.com>
 <5143FB1F.9010509@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

>On 03/15/13 14:56, Manolo Díaz wrote:
>> Hi,
>> 
>> It seems that the kernel loglevel is set to 7 ignoring the
>> CONFIG_DEFAULT_MESSAGE_LOGLEVEL option (set to 4 in my config file)
>> 
>> The /proc/sys/kernel/printk output is 
>> 
>> 7	4	1	7
>> 
>> Passing the boot parameter "loglevel=4" or echoing "4 4 1 7"
>> to /proc/sys/kernel/printk solves my problem and then this proc file
>> contains
>> 
>> 4	4	1	7
>> 
>> as expected.
>> 
>> kernel version:
>> Linux version 3.8.3 (root@alcyone) (gcc version 4.7.2 (Debian 4.7.2-5)
>> ) #2 SMP Fri Mar 15 08:23:50 CET 2013
>> 
>> config file is gziped and attached.
>
>
>Hi,
>
>CONFIG_DEFAULT_MESSAGE_LOGLEVEL modifies the second field (value) in /proc/sys/kernel/printk,
>not the first value.  OTOH, the "loglevel" kernel parameter modifies the first value in
>that /proc file, not the second value.
>
>Does that clarify/help?
>

Yes, I misunderstood the meaning of default_message_loglevel. Sorry.

Regards,
-- 
Manolo Díaz
