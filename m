Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vs1-f68.google.com ([209.85.217.68]:34481 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727034AbgBCD0g (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 2 Feb 2020 22:26:36 -0500
MIME-Version: 1.0
In-Reply-To: <20200202050922.12402-3-masahiroy@kernel.org>
References: <20200202050922.12402-1-masahiroy@kernel.org> <20200202050922.12402-3-masahiroy@kernel.org>
From: Justin Capella <justincapella@gmail.com>
Date: Sun, 2 Feb 2020 19:26:34 -0800
Message-ID: <CAMrEMU9ZBAwOPsqeKw0sUF0EWnfO1-UtOKROD6T1AjYX_tWLXA@mail.gmail.com>
Subject: Re: [PATCH 3/3] kallsyms: fix type of kallsyms_token_table[]
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marc Zyngier <maz@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org

unsigned char maybe? I understand printable chars unlikely to cause
any trouble and probably a non issue, but the domain is different for
char, and while I don't know of supported implementations where sizeof
char isn't a byte, I think it's a possibility and perhaps why u8 was
in use?
