Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f181.google.com ([209.85.192.181]:36247 "EHLO
        mail-pf0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752992AbdGGAJe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Jul 2017 20:09:34 -0400
Received: by mail-pf0-f181.google.com with SMTP id q86so8366640pfl.3
        for <linux-kbuild@vger.kernel.org>; Thu, 06 Jul 2017 17:09:33 -0700 (PDT)
Subject: Re: [PATCH 1/4] kasan: support alloca() poisoning
References: <20170706220114.142438-1-ghackmann@google.com>
 <20170706220114.142438-2-ghackmann@google.com>
From: Greg Hackmann <ghackmann@google.com>
Message-ID: <504eb5d1-d505-46fe-86aa-5b2d01497c15@google.com>
Date: Thu, 6 Jul 2017 17:09:31 -0700
MIME-Version: 1.0
In-Reply-To: <20170706220114.142438-2-ghackmann@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>
Cc: linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-kbuild@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>, Michael Davidson <md@google.com>

On 07/06/2017 03:01 PM, Greg Hackmann wrote:
> @@ -101,6 +101,9 @@ static const char *get_shadow_bug_type(struct kasan_access_info *info)
>   		break;
>   	case KASAN_USE_AFTER_SCOPE:
>   		bug_type = "use-after-scope";
> +	case KASAN_ALLOCA_LEFT:
> +	case KASAN_ALLOCA_RIGHT:
> +		bug_type = "alloca-out-of-bounds";
>   		break;
>   	}

There needs to be a "break" above the new case statements.  I'll wait to 
see if there's any other feedback, then send out a V2 patch that fixes this.
