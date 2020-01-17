Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:58496 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729037AbgAQDyp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Jan 2020 22:54:45 -0500
Subject: Re: [PATCH] kconfig: fix documentation typos
References: <20200113232212.138327-1-helgaas@kernel.org>
 <CAK7LNASYynBVaaGROEjy1PC7+9xatO7gf2LTRGG1UOpiXtzENw@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <26736fee-6e8e-9a05-59c4-6f9d13e31864@infradead.org>
Date: Thu, 16 Jan 2020 19:54:43 -0800
MIME-Version: 1.0
In-Reply-To: <CAK7LNASYynBVaaGROEjy1PC7+9xatO7gf2LTRGG1UOpiXtzENw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Jonathan Corbet <corbet@lwn.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>

On 1/16/20 6:17 PM, Masahiro Yamada wrote:
> On Tue, Jan 14, 2020 at 8:22 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
>>
>> From: Bjorn Helgaas <bhelgaas@google.com>
>>
>> Fix a couple typos in kconfig-language documentation.
>>
>> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
>> ---
>>  Documentation/kbuild/kconfig-language.rst | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
>> index 74bef19f69f0..f547720bd82d 100644
>> --- a/Documentation/kbuild/kconfig-language.rst
>> +++ b/Documentation/kbuild/kconfig-language.rst
>> @@ -594,7 +594,7 @@ The two different resolutions for b) can be tested in the sample Kconfig file
>>  Documentation/kbuild/Kconfig.recursion-issue-02.
>>
>>  Below is a list of examples of prior fixes for these types of recursive issues;
>> -all errors appear to involve one or more select's and one or more "depends on".
>> +all errors appear to involve one or more "selects" and one or more "depends on".
> 
> 
> I think "selects" is strange here.

I thought so when I read it also.

> 
> "select" is a Kconfig keyword.
> select's is intentional, I guess.

Yes, I expect so.

> Keep it as-is, or perhaps change it into "select" (singular) ?

Maybe:

 Below is a list of examples of prior fixes for these types of recursive issues;
-all errors appear to involve one or more select's and one or more "depends on".
+all errors appear to involve one or more "select"s and one or more "depends on".


-- 
~Randy
