Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05601C77B7A
	for <linux-kbuild@archiver.kernel.org>; Sat, 13 May 2023 23:30:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229447AbjEMXan (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Sat, 13 May 2023 19:30:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232064AbjEMXam (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 13 May 2023 19:30:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2FDC270F;
        Sat, 13 May 2023 16:30:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3EA5B614F1;
        Sat, 13 May 2023 23:30:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBB2EC433D2;
        Sat, 13 May 2023 23:30:37 +0000 (UTC)
Date:   Sat, 13 May 2023 19:30:35 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Jiri Slaby <jirislaby@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        andreas.noever@gmail.com, michael.jamet@intel.com,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        YehezkelShB@gmail.com, USB list <linux-usb@vger.kernel.org>,
        Linux kernel mailing list <linux-kernel@vger.kernel.org>
Subject: Re: make localmodconfig doesn't work for thunderbolt
Message-ID: <20230513193035.6bbf08e3@rorschach.local.home>
In-Reply-To: <20230513192821.34ca93fd@rorschach.local.home>
References: <4cb758c7-f4f5-820c-c7e7-5b900ccc2534@kernel.org>
        <CAK7LNATQeT8MaQr450x0SpHJV=QU7nrfWfDO1ZRKimppVZG4KA@mail.gmail.com>
        <20230513192821.34ca93fd@rorschach.local.home>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, 13 May 2023 19:28:21 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> Thanks Jiri and Masamhiro!

That should have been "Masahiro". Sorry for the misspelling. I type
"Masami" so many times, that the "m" after "Masa" is pretty much
automatic :-/

-- Steve
