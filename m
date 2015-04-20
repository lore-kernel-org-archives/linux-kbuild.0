Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:55013 "EHLO
	services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751443AbbDTSkH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 20 Apr 2015 14:40:07 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: Re: [PATCH] tools/lib/api/Makefile: Add feature check for _FORTIFY_SOURCE
In-Reply-To: <20150420181631.GA19378@gmail.com> (Ingo Molnar's message of
	"Mon, 20 Apr 2015 20:16:31 +0200")
References: <ghlhhnf0j2.fsf@lena.gouders.net>
	<20150420181631.GA19378@gmail.com>
Date: Mon, 20 Apr 2015 20:34:07 +0200
Message-ID: <gh7ft6odi8.fsf@quad.gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Paul Mackerras <paulus@samba.org>, Ingo Molnar <mingo@redhat.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Ingo Molnar <mingo@kernel.org> writes:

> * Dirk Gouders <dirk@gouders.net> wrote:
>
>> For example on Gentoo systems where _FORTIFY_SOURCE is set by default,
>> `make -C tools/perf' fails, because of the macro being redefined.
>> 
>> Fix that by a feature-check analogous to tools/perf/config/Makefile.
>> 
>> Signed-off-by: Dirk Gouders <dirk@gouders.net>
>> ---
>>  tools/lib/api/Makefile | 9 ++++++++-
>>  1 file changed, 8 insertions(+), 1 deletion(-)
>> 
>> diff --git a/tools/lib/api/Makefile b/tools/lib/api/Makefile
>> index d8fe29f..acf9097 100644
>> --- a/tools/lib/api/Makefile
>> +++ b/tools/lib/api/Makefile
>> @@ -16,7 +16,14 @@ MAKEFLAGS += --no-print-directory
>>  LIBFILE = $(OUTPUT)libapi.a
>>  
>>  CFLAGS := $(EXTRA_WARNINGS) $(EXTRA_CFLAGS)
>> -CFLAGS += -ggdb3 -Wall -Wextra -std=gnu99 -Werror -O6 -D_FORTIFY_SOURCE=2 -fPIC
>> +CFLAGS += -ggdb3 -Wall -Wextra -std=gnu99 -Werror -O6 -fPIC
>> +
>> +ifeq ($(DEBUG),0)
>> +  ifeq ($(feature-fortify-source), 1)
>> +    CFLAGS += -D_FORTIFY_SOURCE=2
>> +  endif
>> +endif
>
> So how about undefining it instead and re-defining it as 
> _FORTIFY_SOURCE=2?
>
> Just in case a distro sets a weaker version - lets not accept that 
> weaker setting. We've always had the stronger version of it.

Yes, I was suggesting something similar (but without founded reasoning),
some time ago [1].

Would the "undefining-approch" mean that we should modify the handling
of _FORTIFY_SOURCE in tools/perf/config/Makefile as well?

Dirk

[1] https://lkml.org/lkml/2013/5/22/186
