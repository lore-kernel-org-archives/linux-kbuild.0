Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mu-out-0910.google.com ([209.85.134.184]:38253 "EHLO
	mu-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751699AbYDPUD2 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 16 Apr 2008 16:03:28 -0400
Received: by mu-out-0910.google.com with SMTP id w8so1757397mue.1
        for <linux-kbuild@vger.kernel.org>; Wed, 16 Apr 2008 13:03:00 -0700 (PDT)
Message-ID: <4806583B.5080305@gmail.com>
Date: Wed, 16 Apr 2008 21:49:15 +0200
From: Jacek Luczak <difrost.kernel@gmail.com>
MIME-Version: 1.0
Subject: Re: 2.6.25 and DEBUG_SECTION_MISMATCH
References: <20080416175135.GN1677@cs181133002.pp.htv.fi> <20080416192306.GA3090@uranus.ravnborg.org> <20080416193102.GA16981@elte.hu>
In-Reply-To: <20080416193102.GA16981@elte.hu>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Sam Ravnborg <sam@ravnborg.org>, Adrian Bunk <bunk@kernel.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Ingo Molnar pisze:
> * Sam Ravnborg <sam@ravnborg.org> wrote:
> 
>> I would prefer we were down to less than 5 warnings so we could enable 
>> it in kconfig but maybe after next merge window.
> 
> they get regenerated. More than 1 out of every 100 new patches. Quite 
> expensive feature (in terms of maintenance overhead) for a rather 
> theoretical memory saving benefit.

Ok, that's why this should be done in places where we are sure that given
function is called once and none should call more. So in general this should
result in removing few(?) annotations not in adding it everywhere where mismatch
appears.

-Jacek
