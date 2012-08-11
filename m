Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from oproxy5-pub.bluehost.com ([67.222.38.55]:37170 "HELO
	oproxy5-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1754198Ab2HKAk6 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 10 Aug 2012 20:40:58 -0400
Message-ID: <5025A9C6.1080207@xenotime.net>
Date: Fri, 10 Aug 2012 17:39:34 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
MIME-Version: 1.0
Subject: Re: [PATCH] xconfig: Display dependency values in debug_info
References: <1343256982-11421-1-git-send-email-salaarali@gmail.com> <50107EB7.8000009@xenotime.net> <CA+jpPM=nrbpDJpaka6xAp4dbEOQjJrtwQWtUXwi_gGS9b4yK-A@mail.gmail.com> <50117812.5080302@xenotime.net> <50213D69.3060904@gmail.com> <5021486B.6020907@xenotime.net> <50240770.6070207@gmail.com>
In-Reply-To: <50240770.6070207@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Salar Ali Mumtaz <salaarali@gmail.com>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 08/09/2012 11:54 AM, Salar Ali Mumtaz wrote:

> On 12-08-07 12:55 PM, Randy Dunlap wrote:
> 
>> In Kconfig language, is "" the same as 'n' ?
>> If so, I'm OK with your proposal above.
>>
> 
> 
> So a colleague of mine tested this and came up with a conclusion that expressions in Kconfig can only deal with boolean or tristate operands and no casting is made with strings. Using any string operand as part of a boolean expression is simply a type error and Kconfig probably marks such operand as 'n', regardless of its value.
> 


My question was about FRV, which is a boolean,
but still did not display as 'n' in your example.


-- 
~Randy
