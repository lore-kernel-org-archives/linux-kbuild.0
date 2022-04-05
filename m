Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B725C43219
	for <linux-kbuild@archiver.kernel.org>; Wed,  6 Apr 2022 00:44:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350137AbiDFAmL (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Tue, 5 Apr 2022 20:42:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1454002AbiDEP5r (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Apr 2022 11:57:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35461166678;
        Tue,  5 Apr 2022 08:02:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C52656175E;
        Tue,  5 Apr 2022 15:02:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF555C385A1;
        Tue,  5 Apr 2022 15:02:44 +0000 (UTC)
Date:   Tue, 5 Apr 2022 11:02:43 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Masami Hiramatsu <mhiramat@kernel.org>
Cc:     Padmanabha Srinivasaiah <treasure4paddy@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH v7 3/4] bootconfig: Support embedding a bootconfig file
 in kernel
Message-ID: <20220405110243.21cdee07@gandalf.local.home>
In-Reply-To: <20220405235548.38344aba5a7fcb059924c367@kernel.org>
References: <164871505771.178991.7870442736805590948.stgit@devnote2>
        <164871509158.178991.12705786877340857725.stgit@devnote2>
        <20220405235548.38344aba5a7fcb059924c367@kernel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, 5 Apr 2022 23:55:48 +0900
Masami Hiramatsu <mhiramat@kernel.org> wrote:

> Have you already picked this series?

No I haven't. I do not add any patches until after the merge window, which
just ended Sunday.

> 
> Actually, kernel test robot reported an issue in this patch today.
> Here is the patch. Should I send v8 including this?

Yes, please send a v8.

Thanks!

-- Steve
