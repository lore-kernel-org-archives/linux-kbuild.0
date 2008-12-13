Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from wf-out-1314.google.com ([209.85.200.175]:45544 "EHLO
	wf-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752776AbYLMAQW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 12 Dec 2008 19:16:22 -0500
Received: by wf-out-1314.google.com with SMTP id 27so1568062wfd.4
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Dec 2008 16:16:21 -0800 (PST)
Message-ID: <8499950a0812121616lf6fcff6me0bac5aa7d73b31@mail.gmail.com>
Date: Sat, 13 Dec 2008 02:16:21 +0200
From: "Oleg Verych" <olecom@gmail.com>
Subject: Re: [PATCH 1/1] tags.sh: fix string equality testing
In-Reply-To: <1228913318-6003-1-git-send-email-jirislaby@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1228913318-6003-1-git-send-email-jirislaby@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jiri Slaby <jirislaby@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On 12/10/08, Jiri Slaby <jirislaby@gmail.com> wrote:

> Test of string equality in shells is =, not C-like ==.
> -if [ $KBUILD_VERBOSE == 1 ]; then
> +if [ $KBUILD_VERBOSE = 1 ]; then

also it is better to use quotes, because `[' gets $IFS'ed parameters otherwise:

|> +if [ "$KBUILD_VERBOSE" = 1 ]; then

-- 
sed 'sed && sh + olecom = love'  <<  ''
-o--=O`C
 #oo'L O
<___=E M
