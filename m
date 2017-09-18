Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:58562 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755125AbdIRJaE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Sep 2017 05:30:04 -0400
Date: Mon, 18 Sep 2017 11:30:14 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] kbuild: deb-pkg: remove firmware package support
Message-ID: <20170918093014.GA5936@kroah.com>
References: <1505726539-30725-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1505726539-30725-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Markus Trippelsdorf <markus@trippelsdorf.de>, Ben Hutchings <ben@decadent.org.uk>, Riku Voipio <riku.voipio@linaro.org>, Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org

On Mon, Sep 18, 2017 at 06:22:19PM +0900, Masahiro Yamada wrote:
> Commit 5620a0d1aacd ("firmware: delete in-kernel firmware") deleted
> in-kernel firmware support, including the firmware install command.
> 
> So, the firmware package does not make sense any more.  Remove it.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
