Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:36131 "EHLO
        mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751882AbdBTJcQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Feb 2017 04:32:16 -0500
Received: by mail-wm0-f49.google.com with SMTP id c85so72991255wmi.1
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Feb 2017 01:32:15 -0800 (PST)
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH v6 7/8] uapi: export all headers under uapi directories
References: <201702022242.toNVsxyq%fengguang.wu@intel.com>
 <1486724338-5389-1-git-send-email-nicolas.dichtel@6wind.com>
 <1486724338-5389-8-git-send-email-nicolas.dichtel@6wind.com>
 <20170213074931.GA19927@infradead.org>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Message-ID: <fc363060-f00d-e9e6-c548-6bfe73665e93@6wind.com>
Date: Mon, 20 Feb 2017 10:32:12 +0100
MIME-Version: 1.0
In-Reply-To: <20170213074931.GA19927@infradead.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: arnd@arndb.de, mmarek@suse.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, airlied@linux.ie, davem@davemloft.net, linux@armlinux.org.uk, bp@alien8.de, slash.tmp@free.fr, daniel.vetter@ffwll.ch, rmk+kernel@armlinux.org.uk, msalter@redhat.com, jengelh@inai.de, tklauser@distanz.ch, mpe@ellerman.id.au, mingo@kernel.org

Le 13/02/2017 à 08:49, Christoph Hellwig a écrit :
>> linux/genwqe/..install.cmd
>> linux/genwqe/.install
> 
> Third time:  NAK on exporting internal kbuild metadata.
> 
And for the third time: this is not related to this series. Those files are
there before my series and the goal of the series has nothing to do with that.

Feel free to send a patch.


Regards,
Nicolas
