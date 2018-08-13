Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:55016 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729029AbeHMUKB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Aug 2018 16:10:01 -0400
Date: Mon, 13 Aug 2018 19:20:03 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 1/2] kconfig: remove unused sym_get_env_prop() function
Message-ID: <20180813172003.GA20519@ravnborg.org>
References: <1534178919-8375-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1534178919-8375-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Dirk Gouders <dirk@gouders.net>, Ulf Magnusson <ulfalizer@gmail.com>, linux-kernel@vger.kernel.org

On Tue, Aug 14, 2018 at 01:48:38AM +0900, Masahiro Yamada wrote:
> This function is unused since commit 104daea149c4 ("kconfig: reference
> environment variables directly and remove 'option env='").
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Both patches are obviously correct.
Feel free to add:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

and apply to kbuild so we  can get them in this cycle.

	Sam
