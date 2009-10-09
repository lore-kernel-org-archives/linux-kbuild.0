Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pz0-f188.google.com ([209.85.222.188]:64823 "EHLO
	mail-pz0-f188.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751220AbZJIFif (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 9 Oct 2009 01:38:35 -0400
Received: by pzk26 with SMTP id 26so6029801pzk.4
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Oct 2009 22:37:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20091009042829.GA32078@merkur.ravnborg.org>
References: <f750ee70910082014h3e4b2be1lc98cf0df1b3583af@mail.gmail.com>
	 <f750ee70910082015x46f0f351t2d4651e01ba74ac9@mail.gmail.com>
	 <20091009042829.GA32078@merkur.ravnborg.org>
Date: Fri, 9 Oct 2009 11:07:59 +0530
Message-ID: <f750ee70910082237t81eea57y74d992e2da5af792@mail.gmail.com>
Subject: Re: kbuild generating prefix-foo.o from foo.c
From: kartikeyan sadasivuni <s.kartikeyan@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org

hi,

>
> Is it an option for you to create a copy of said file?

I could do this but just looking for a cleaner approach.
I have a working solution but looking for better ways.
I wanted to avoid using the line (as kbuild can change in future and
so c_flags var)
 $(CC) $(c_flags) -c -o $@ $<
and call something Kbuild already has
but  with changed prerequisite/dependency.



kartikeyan
