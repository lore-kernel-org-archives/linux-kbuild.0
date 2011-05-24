Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:46786 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932413Ab1EXOSB convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 24 May 2011 10:18:01 -0400
Received: by iwn34 with SMTP id 34so5795681iwn.19
        for <linux-kbuild@vger.kernel.org>; Tue, 24 May 2011 07:18:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4DDB8CB4.2090701@suse.cz>
References: <1306138239-13440-1-git-send-email-lacombar@gmail.com>
	<4DDB8CB4.2090701@suse.cz>
Date: Tue, 24 May 2011 10:18:00 -0400
Message-ID: <BANLkTiknMSzx9yS5zrUnwtXzMPoe34G4tQ@mail.gmail.com>
Subject: Re: [RFCv2 00/13] Kbuild: factor parser rules
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, David Gibson <david@gibson.dropbear.id.au>

Hi,

2011/5/24 Michal Marek <mmarek@suse.cz>:
> On 23.5.2011 10:10, Arnaud Lacombe wrote:
>>
>> Hi,
>>
>> [ Original RFC and motivation can be found at:
>> http://marc.info/?l=linux-kbuild&m=130456101131801&w=2 ]
>>
>> I tried to re-think the order in this serie to address Michal comments.
>>
>> Main changes since v1 are:
>>  - include scripts/dtc/' parser in the scope of the patchset
>>  - do not rename any parser source
>>  - make lexer file name consistent, ie. name it %.lex.c, not lex.%.c
>>  - rebase on top of v2.6.39
>>
>> A few notes:
>>  - the parser should not include the lexer; however, this has the
>> advantage to
>>    avoid having to deals with the parser's header.
>>  - the tuple ( "migrate parser to implicit rules", regen parser) should
>> really
>>    be one commit, to enforce bisect'ability
>>
>> Comments welcome!
>>  - Arnaud
>
> Hi,
>
> thanks for the series, but I will probably not have time to review it before
> this merge window closes. So it will have to wait for .41 most likely.
>
fine with me, I am not entirely happy with that serie anyway, so I'll
certainly do another iteration after -rc1 (to include whatever has
changed in the mean time).

 - Arnaud
