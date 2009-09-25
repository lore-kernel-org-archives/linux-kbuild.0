Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.dev.rtsoft.ru ([213.79.90.226]:42153 "HELO
	mail.dev.rtsoft.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751814AbZIYJji (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 25 Sep 2009 05:39:38 -0400
Message-ID: <4ABC8FDB.2000502@ru.mvista.com>
Date: Fri, 25 Sep 2009 13:39:39 +0400
From: Yuri Frolov <yfrolov@ru.mvista.com>
MIME-Version: 1.0
Subject: Re: [patch] powerpc: build modules outside the kernel tree fails,
 if it was built using O=
References: <4ABB57CB.3000409@ru.mvista.com> <1253841141.7103.489.camel@pasglop> <20090925043902.GA2484@merkur.ravnborg.org>
In-Reply-To: <20090925043902.GA2484@merkur.ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org, rep.dot.nop@gmail.com, linux-kbuild@vger.kernel.org

On 09/25/2009 08:39 AM, Sam Ravnborg wrote:
> On Fri, Sep 25, 2009 at 11:12:21AM +1000, Benjamin Herrenschmidt wrote:
>> On Thu, 2009-09-24 at 15:28 +0400, Yuri Frolov wrote:
>>> Hello,
>>>
>>> here is a corresponding bug: http://bugzilla.kernel.org/show_bug.cgi?id=11143
>>> This patch should correctly export crtsavres.o in order to make O= option working.
>>> Please, consider to apply.
>>>
>>>
>>> Fix linking modules against crtsavres.o
>> Hi !
>>
>> This is the same patch you already posted as "
>>
>>
>> [PATCH] Fix linking modules against
>> crtsavres.o
>> "
>>
>> Or it's an update ?

It's the same, sorry for not mentioning it. The previous letter contains attachment crap, so I sent the letter with patch in-lined.

>>
>> I've asked Sam to review it already since it affects the main kernel
>> makefiles, waiting for his answer.
> Saw the duplicates. Will get back to it tonight (morning here now).
> 
> 	Sam
Ok, thank you.
