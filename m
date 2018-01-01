Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk4.altibox.net ([109.247.116.15]:38327 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751059AbeAAJzf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jan 2018 04:55:35 -0500
Date: Mon, 1 Jan 2018 10:55:30 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2] fixdep: exit with error code in error branches of
 do_config_file()
Message-ID: <20180101095530.GA6547@ravnborg.org>
References: <1513801623-19069-1-git-send-email-lukas.bulwahn@gmail.com>
 <1513883429-9527-1-git-send-email-lukas.bulwahn@gmail.com>
 <CAK7LNAROjcbES8-debAnzVz1EV1Ar+RLW8phF5+bQxpHQUODKQ@mail.gmail.com>
 <20171231154548.GA27372@osadl.at>
 <CAK7LNAS_U4_ugOSnohJL3rpepRpQ17C3OT4K5ohkAYMKc9wGgg@mail.gmail.com>
 <20180101093121.GA7228@osadl.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180101093121.GA7228@osadl.at>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicholas Mc Guire <der.herr@hofr.at>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, sil2review@lists.osadl.org, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

> >
> And would that file be acceptable if it were actually empty

There have been cases with empty files in the source tree.
And it is not the job of fixdep to do anything special about them.
fixdep shall do what it is requested to do, and not more than
that.

	Sam
