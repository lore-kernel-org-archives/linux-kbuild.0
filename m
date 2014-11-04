Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.emea.novell.com ([130.57.118.101]:38945 "EHLO
	mail.emea.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753363AbaKDOOT convert rfc822-to-8bit (ORCPT
	<rfc822;groupwise-linux-kbuild@vger.kernel.org:3:1>);
	Tue, 4 Nov 2014 09:14:19 -0500
Message-Id: <5458ED470200007800044DA7@mail.emea.novell.com>
Date: Tue, 04 Nov 2014 14:14:15 +0000
From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/2] kconfig: don't silently ignore unhandled
 characters
References: <5458A4FC0200007800044AC1@mail.emea.novell.com>
 <1415110006.20372.165.camel@x220>
In-Reply-To: <1415110006.20372.165.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org

>>> On 04.11.14 at 15:06, <pebolle@tiscali.nl> wrote:
> On Tue, 2014-11-04 at 09:05 +0000, Jan Beulich wrote:
>> At the very least we should tell people that waht they wrote is not
>> what the utility understands.
> 
> Yes, we should change this. I'm inclined to think the should die with an
> error on invalid syntax. Would that be too strict?  

I would think so. This could be made more strict once the warning
was in place for a couple of releases.

>> --- 3.18-rc3-kconfig.orig/scripts/kconfig/zconf.lex.c_shipped
>> +++ 3.18-rc3-kconfig/scripts/kconfig/zconf.lex.c_shipped
>> @@ -414,14 +414,14 @@ static yyconst flex_int16_t yy_nxt[][17]
>>      },
>>  
>>      {
>> -       11,   26,   26,   27,   28,   29,   30,   31,   29,   32,
>> -       33,   34,   35,   35,   36,   37,   38
>> +       11,   26,   27,   28,   29,   30,   31,   32,   30,   33,
>> +       34,   35,   36,   36,   37,   38,   39
>>  
>>      },
>>  
>>      {
>> -       11,   26,   26,   27,   28,   29,   30,   31,   29,   32,
>> -       33,   34,   35,   35,   36,   37,   38
>> +       11,   26,   27,   28,   29,   30,   31,   32,   30,   33,
>> +       34,   35,   36,   36,   37,   38,   39
>>      },
>>  
>>      {
> 
> I guess we must trust that you manually edited this _shipped file
> correctly.

There was no manual editing involved - this is the re-generated
version.

>> @@ -920,7 +931,7 @@ static int input (void );
>>  /* This used to be an fputs(), but since the string might contain NUL's,
>>   * we now use fwrite().
>>   */
>> -#define ECHO do { if (fwrite( zconftext, zconfleng, 1, zconfout )) {} } while (0)
>> +#define ECHO fwrite( zconftext, zconfleng, 1, zconfout )
>>  #endif
>>  
>>  /* Gets input and stuffs it into "buf".  number of characters read, or YY_NULL,
> 
> But this hunk looks unrelated. Is this needed?

I think it should stay, even if my flex version may be slightly different
from the one that was used originally. As above - it's simply a result
of re-generating.

Jan

