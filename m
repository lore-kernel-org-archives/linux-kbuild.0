Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from fg-out-1718.google.com ([72.14.220.159]:39304 "EHLO
	fg-out-1718.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754943AbZIVPuQ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Sep 2009 11:50:16 -0400
Message-ID: <4AB8F238.3040105@tuffmail.co.uk>
Date: Tue, 22 Sep 2009 16:50:16 +0100
From: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] module: extract __ExPORT_SYMBOL from module.h into
 mod_export.h
References: <1253626718-18887-1-git-send-email-alan-jenkins@tuffmail.co.uk>	 <1253626718-18887-2-git-send-email-alan-jenkins@tuffmail.co.uk> <1253634337.22454.3.camel@desktop>
In-Reply-To: <1253634337.22454.3.camel@desktop>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Daniel Walker <dwalker@fifo99.com>
Cc: rusty@rustcorp.com.au, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-modules@vger.org

Daniel Walker wrote:
> On Tue, 2009-09-22 at 14:38 +0100, Alan Jenkins wrote:
>   
>> +
>> +struct kernel_symbol
>> +{
>> +       unsigned long value;
>> +       const char *name;
>> +};
>>     
>
> One relevant checkpatch error above,
>
> ERROR: open brace '{' following struct go on the same line
> #71: FILE: include/linux/mod_export.h:13:
> +struct kernel_symbol
> +{
>
> You have another similar one in patch 4 ,
>
> ERROR: else should follow close brace '}'
> #99: FILE: kernel/module.c:221:
> +               }
> +               else if (cmp < 0)
>
>
> Could you correct those?
>
> Daniel
>   

Sure, thanks.  I'll hold off on resending though, in case there are any
more radical changes needed.

Alan
