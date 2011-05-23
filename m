Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:39525 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750883Ab1EWJHd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 May 2011 05:07:33 -0400
Received: by iyb14 with SMTP id 14so4490718iyb.19
        for <linux-kbuild@vger.kernel.org>; Mon, 23 May 2011 02:07:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201105231054.47573.yann.morin.1998@anciens.enib.fr>
References: <1306138239-13440-1-git-send-email-lacombar@gmail.com>
	<1306138239-13440-8-git-send-email-lacombar@gmail.com>
	<201105231054.47573.yann.morin.1998@anciens.enib.fr>
Date: Mon, 23 May 2011 05:07:32 -0400
Message-ID: <BANLkTin30z8T0HqJsZTcgTZN2iFOvhYytg@mail.gmail.com>
Subject: Re: [RFCv2 07/13] kconfig: back-out parser prefix, from `zconf' to `yy'
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>

Hi,

On Mon, May 23, 2011 at 4:54 AM, Yann E. MORIN
<yann.morin.1998@anciens.enib.fr> wrote:
> Arnaud, All,
>
> On Monday 23 May 2011 101033 Arnaud Lacombe wrote:
>> ---
>>  scripts/kconfig/lkc.h   |    2 +-
>>  scripts/kconfig/zconf.l |   16 ++++++++--------
>>  scripts/kconfig/zconf.y |   22 +++++++++++-----------
>>  3 files changed, 20 insertions(+), 20 deletions(-)
>>
>> diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
>> index febf0c9..716c36c 100644
>> --- a/scripts/kconfig/lkc.h
>> +++ b/scripts/kconfig/lkc.h
>> @@ -69,7 +69,7 @@ struct kconf_id {
>>  };
>>
>>  #ifdef YYDEBUG
>> -extern int zconfdebug;
>> +extern int yyebug;
>
> Missing 'd' in yyebug, maybe? See below...
>
indeed :) ...fixed,

Thanks,
 - Arnaud
