Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f181.google.com ([209.85.223.181]:35341 "EHLO
	mail-io0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753706AbcHPUGm (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 16 Aug 2016 16:06:42 -0400
Received: by mail-io0-f181.google.com with SMTP id m101so117755928ioi.2
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Aug 2016 13:06:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1471354514-12323-2-git-send-email-dmonakhov@openvz.org>
References: <1471354514-12323-1-git-send-email-dmonakhov@openvz.org> <1471354514-12323-2-git-send-email-dmonakhov@openvz.org>
From: Jim Davis <jim.epost@gmail.com>
Date: Tue, 16 Aug 2016 13:06:41 -0700
Message-ID: <CA+r1ZhhSa0bfP_iDOP8zsXtEcKYmwWQViyhAq-bPjvk93di58w@mail.gmail.com>
Subject: Re: [PATCH 2/2] scripts: buildtar use parallel compress if available
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dmitry Monakhov <dmonakhov@openvz.org>
Cc: linux-kbuild@vger.kernel.org

On Tue, Aug 16, 2016 at 6:35 AM, Dmitry Monakhov <dmonakhov@openvz.org> wrote:

> +               type pigz >/dev/null 2>&1 && compress="pigz"

Isn't the "type" builtin a feature of the bash shell?  The buildtar
script won't necessarily be executed by bash.

-- 
Jim
