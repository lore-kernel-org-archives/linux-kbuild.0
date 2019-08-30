Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0043.hostedemail.com ([216.40.44.43]:43654 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726660AbfH3LJT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 30 Aug 2019 07:09:19 -0400
Message-ID: <ccc65bd29747f8ad4d0ba1b3eda6c9d230f03c70.camel@perches.com>
Subject: Re: [PATCH] Makefile: Convert -Wimplicit-fallthrough to
 -Wimplicit-fallthrough=2
From: Joe Perches <joe@perches.com>
Date: Fri, 30 Aug 2019 04:09:15 -0700
In-Reply-To: <20190829120215.1977-1-msuchanek@suse.de>
References: <20190829120215.1977-1-msuchanek@suse.de>
Content-Type: text/plain; charset="ISO-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Suchanek <msuchanek@suse.de>, linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

On Thu, 2019-08-29 at 14:02 +0200, Michal Suchanek wrote:
> In particular the default value of 3 does not match the comments like
> /* falls through to do foobar */

How many comments are there like this in the kernel?

Also you have to deal with gcc/clang differences.
As far as I know, clang doesn't take a value for this.
