Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AA2FC61DA4
	for <linux-kbuild@archiver.kernel.org>; Mon, 13 Mar 2023 10:27:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbjCMK1g (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Mon, 13 Mar 2023 06:27:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjCMK1f (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Mar 2023 06:27:35 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DC013D93E;
        Mon, 13 Mar 2023 03:27:35 -0700 (PDT)
Message-ID: <f9ffe524-21be-4d35-b700-30faaa5841fc@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1678703253;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rq0YSUEVkW/ymdvQmMGv1vXwwm1dfjT8X4OBlFPp6eY=;
        b=wZGHGfL/uJXrzqnuHN7a/+SsZbUVVpg7WB0+8HefrYYNjNhNfmJvvFmK45mkfYoRB1rprC
        F+EwWNq5CfOHTVyv4wcEo8VrXHhpTjmKQhXF3OLp5FGSeBuhkVNvUOjLvKfueGv7vMbDx5
        /VhOMqPJyOiZjj8yVPLTSpyJvAgkrEknWkr7T6cVWXlbAABA0HeyOJv9JIzyOjxMHB1HKt
        +J09dSqarT/Vc54H8Unm7krExAKbghRp/E3uB7dx8HsSL8GSyePHGVM+4AJVe9zDNtgxBT
        rdA2624gCqnQKEKbAZ9aulbWyf0XAKwG4tXyurp8+YNPIxVdhHyPf6jGDdYwXQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1678703253;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rq0YSUEVkW/ymdvQmMGv1vXwwm1dfjT8X4OBlFPp6eY=;
        b=thnu0MALUlRXdm9w0r7zwelwIklfpWZvR1Qm0pjGNGI0DQFmiYxv/kCohI6NFQCwUlG8c8
        alq+DcWkKuJ/VDCQ==
Date:   Mon, 13 Mar 2023 11:27:33 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/1] builddeb: introduce profile excluding the dbg pkg
Content-Language: de-DE-frami
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230313094106.46770-1-bage@linutronix.de>
From:   Bastian Germann <bage@linutronix.de>
In-Reply-To: <20230313094106.46770-1-bage@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Am 13.03.23 um 10:41 schrieb Bastian Germann:
> Changelog:
> v2:
>   * Align the profile name with the one that ended up in Debian.
> v3:
>   * Prevent the creation of the dbg package when profile is set

Please ignore v3. Sent the wrong patches.
