Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt0-f178.google.com ([209.85.216.178]:41757 "EHLO
        mail-qt0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751108AbeAYTRk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Jan 2018 14:17:40 -0500
Received: by mail-qt0-f178.google.com with SMTP id i1so21992780qtj.8
        for <linux-kbuild@vger.kernel.org>; Thu, 25 Jan 2018 11:17:40 -0800 (PST)
Date: Thu, 25 Jan 2018 11:17:35 -0800
From: Jakub Kicinski <jakub.kicinski@netronome.com>
Subject: Re: [oss-drivers] Re: [PATCH] kbuild: make Makefile|Kbuild in each
 directory optional
Message-ID: <20180125111735.11f483a7@cakuba.netronome.com>
In-Reply-To: <CAK7LNARzBkLWFYEvVrXvT+YrivKuVGraKWTexVWyqTxxFWPG+A@mail.gmail.com>
References: <20180125014119.31219-1-jakub.kicinski@netronome.com>
        <CAK7LNARzBkLWFYEvVrXvT+YrivKuVGraKWTexVWyqTxxFWPG+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, netdev@vger.kernel.org, oss-drivers@netronome.com

On Thu, 25 Jan 2018 22:15:47 +0900, Masahiro Yamada wrote:
> For your specific problem, please fix netronome/nfp/Makefile

Would you be able to suggest a way of splitting a module Makefile?
I failed to find a way of doing that.  The only solution I see is 
to create empty Makefiles in subdirectories (5 of them).
