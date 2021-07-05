Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96DD3C07E98
	for <linux-kbuild@archiver.kernel.org>; Mon,  5 Jul 2021 05:05:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 68DBE613C8
	for <linux-kbuild@archiver.kernel.org>; Mon,  5 Jul 2021 05:05:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbhGEFIL (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Mon, 5 Jul 2021 01:08:11 -0400
Received: from wtarreau.pck.nerim.net ([62.212.114.60]:57247 "EHLO 1wt.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229728AbhGEFIL (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Jul 2021 01:08:11 -0400
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 16555IWO031007;
        Mon, 5 Jul 2021 07:05:18 +0200
Date:   Mon, 5 Jul 2021 07:05:18 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     ojeda@kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Sumera Priyadarsini <sylphrenadin@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Gary Guo <gary@garyguo.net>,
        Boris-Chengbiao Zhou <bobo1239@web.de>,
        Fox Chen <foxhlchen@gmail.com>,
        Ayaan Zaidi <zaidi.ayaan@gmail.com>,
        Douglas Su <d0u9.su@outlook.com>, Yuki Okushi <jtitor@2k36.org>
Subject: Re: [PATCH 15/17] scripts: add `generate_rust_analyzer.py`
Message-ID: <20210705050518.GC30964@1wt.eu>
References: <20210704202756.29107-1-ojeda@kernel.org>
 <20210704202756.29107-16-ojeda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210704202756.29107-16-ojeda@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Jul 04, 2021 at 10:27:54PM +0200, ojeda@kernel.org wrote:
> From: Miguel Ojeda <ojeda@kernel.org>
> 
> The `generate_rust_analyzer.py` script generates the configuration
> file (`rust-project.json`) for rust-analyzer.
> 
> rust-analyzer is a modular compiler frontend for the Rust language.
> It provides an LSP server which can be used in editors such as
> VS Code, Emacs or Vim.

You should probably add some doc about this, as I have no idea how
I'm supposed to use this from my editor.

Willy
