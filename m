Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-bw0-f210.google.com ([209.85.218.210]:56800 "EHLO
	mail-bw0-f210.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753659AbZIVOpT (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Sep 2009 10:45:19 -0400
Message-ID: <4AB8E2FF.8040708@tuffmail.co.uk>
Date: Tue, 22 Sep 2009 15:45:19 +0100
From: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] module: extract __ExPORT_SYMBOL from module.h into
 mod_export.h
References: <1253626718-18887-1-git-send-email-alan-jenkins@tuffmail.co.uk> <1253626718-18887-2-git-send-email-alan-jenkins@tuffmail.co.uk> <20090922144216.GA29949@merkur.ravnborg.org>
In-Reply-To: <20090922144216.GA29949@merkur.ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: rusty@rustcorp.com.au, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-modules@vger.org

Sam Ravnborg wrote:
> On Tue, Sep 22, 2009 at 02:38:35PM +0100, Alan Jenkins wrote:
>   
>> The new header mod_export.h allows __EXPORT_SYMBOL to be used without
>> pulling in any function or variable declarations.  It will be used by
>> the build system to help sort the list of symbols exported by the
>> kernel.
>>
>> Signed-off-by: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
>> ---
>>  include/linux/mod_export.h |   74 ++++++++++++++++++++++++++++++++++++++++++++
>>  include/linux/module.h     |   63 +------------------------------------
>>  2 files changed, 75 insertions(+), 62 deletions(-)
>>  create mode 100644 include/linux/mod_export.h
>>
>> diff --git a/include/linux/mod_export.h b/include/linux/mod_export.h
>> new file mode 100644
>> index 0000000..3c51b9c
>> --- /dev/null
>> +++ b/include/linux/mod_export.h
>> @@ -0,0 +1,74 @@
>> +#ifndef LINUX_MOD_EXPORT_H
>> +#define LINUX_MOD_EXPORT_H
>> +
>> +#include <linux/compiler.h>
>> +#include <asm/module.h>
>>     
>
> Do you need this include?
>
> 	Sam
>   
asm/module.h is needed in case the arch sets MODULE_SYMBOL_PREFIX.
 (and linux/compiler.h is needed for __used).

Let me know if you think it needs a comment.

Thanks
Alan
