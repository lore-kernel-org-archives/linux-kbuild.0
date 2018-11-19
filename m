Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from frisell.zx2c4.com ([192.95.5.64]:49839 "EHLO frisell.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729708AbeKTCDG (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Nov 2018 21:03:06 -0500
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5f147e8b
        for <linux-kbuild@vger.kernel.org>;
        Mon, 19 Nov 2018 15:33:07 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7fbedfce (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
        for <linux-kbuild@vger.kernel.org>;
        Mon, 19 Nov 2018 15:33:07 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id k98so28024854otk.3
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Nov 2018 07:39:07 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9riFHZc9zBtFamPOd1N1D=BZoYM9yp+x+o5naerg3wRAA@mail.gmail.com>
 <CAK7LNASfw4uht7AxtX+mSVT9OZgwsbw1Q2yF9z7=YzpxQPuBUg@mail.gmail.com>
In-Reply-To: <CAK7LNASfw4uht7AxtX+mSVT9OZgwsbw1Q2yF9z7=YzpxQPuBUg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 19 Nov 2018 16:38:55 +0100
Message-ID: <CAHmME9pkTUb=hBP+vYPEr4oeV0wfzV9gWcf38MTv_DMWf0JWog@mail.gmail.com>
Subject: Re: Automatic secondary intermediate target deduction
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com
Cc: linux-kbuild@vger.kernel.org

Hi Masahiro,

On Mon, Nov 19, 2018 at 12:23 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> How many intermediate .S files do you have?
> Is it worthwhile computing them automatically?

Right now, 7, and it's pretty easy to list them manually. I already
have implemented as a backup a solution more or less akin to your
suggestion. I just figured there was some chance you might find that
incredible automatic oneliner somehow appealing and prefer it. :P I'll
go with the manual way instead.

Jason
