Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f47.google.com ([209.85.214.47]:38254 "EHLO
        mail-it0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758207AbcLPXCc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Dec 2016 18:02:32 -0500
Received: by mail-it0-f47.google.com with SMTP id b132so3140036iti.1
        for <linux-kbuild@vger.kernel.org>; Fri, 16 Dec 2016 15:02:32 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <58546E96.16770.2C23F1B4@pageexec.freemail.hu>
References: <1481925984-98605-1-git-send-email-keescook@chromium.org>
 <1481925984-98605-2-git-send-email-keescook@chromium.org> <58546E96.16770.2C23F1B4@pageexec.freemail.hu>
From: Kees Cook <keescook@chromium.org>
Date: Fri, 16 Dec 2016 15:02:28 -0800
Message-ID: <CAGXu5j+=TarTeLkZDDESpCyzWXFDAaQrGoPKcHLyGnh5nutKKQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] gcc-plugins: Add the initify gcc plugin
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: PaX Team <pageexec@freemail.hu>
Cc: "kernel-hardening@lists.openwall.com" <kernel-hardening@lists.openwall.com>, Emese Revfy <re.emese@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Josh Triplett <josh@joshtriplett.org>, Brad Spengler <spender@grsecurity.net>, Michal Marek <mmarek@suse.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, minipli@ld-linux.so, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, David Brown <david.brown@linaro.org>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, Jeff Layton <jlayton@poochiereds.net>, Sam Ravnborg <sam@ravnborg.org>

On Fri, Dec 16, 2016 at 2:45 PM, PaX Team <pageexec@freemail.hu> wrote:
> On 16 Dec 2016 at 14:06, Kees Cook wrote:
>
>> diff --git a/scripts/gcc-plugins/gcc-common.h b/scripts/gcc-plugins/gcc-common.h
>> index 950fd2e64bb7..369bfb471e58 100644
>> --- a/scripts/gcc-plugins/gcc-common.h
>> +++ b/scripts/gcc-plugins/gcc-common.h
>> @@ -287,6 +287,26 @@ static inline struct cgraph_node *cgraph_next_function_with_gimple_body(struct c
>>   return NULL;
>>  }
>>
>> +static inline bool cgraph_for_node_and_aliases(cgraph_node_ptr node,
>> +                             bool (*callback)(cgraph_node_ptr, void *),
>> +                             void *data, bool include_overwritable)
>> +{
>> +     cgraph_node_ptr alias;
>> +
>> +     if (callback(node, data))
>> +             return true;
>> +
>> +     for (alias = node->same_body; alias; alias = alias->next) {
>> +             if (include_overwritable ||
>> +                     cgraph_function_body_availability(alias) > AVAIL_OVERWRITABLE)
>> +                     if (cgraph_for_node_and_aliases(alias, callback, data,
>> +                                                     include_overwritable))
>> +                             return true;
>> +     }
>> +
>> +     return false;
>> +}
>> +
>>  #define FOR_EACH_FUNCTION_WITH_GIMPLE_BODY(node) \
>>   for ((node) = cgraph_first_function_with_gimple_body(); (node); \
>>    (node) = cgraph_next_function_with_gimple_body(node))
>
> this hunk above and...
>
>> @@ -674,6 +707,14 @@ static inline cgraph_node_ptr cgraph_alias_target(cgraph_node_ptr node)
>>   return node->get_alias_target();
>>  }
>>
>> +static inline bool cgraph_for_node_and_aliases(cgraph_node_ptr node,
>> +                             bool (*callback)(cgraph_node_ptr, void *),
>> +                             void *data, bool include_overwritable)
>> +{
>> +     return node->call_for_symbol_thunks_and_aliases(callback, data,
>> +                                                     include_overwritable);
>> +}
>> +
>>  static inline struct cgraph_node_hook_list *cgraph_add_function_insertion_hook(cgraph_node_hook hook, void *data)
>>  {
>>   return symtab->add_cgraph_insertion_hook(hook, data);
>
> ...this one aren't needed by any plugins upstream so maybe introduce them when
> the needed arises?

Hrm, sure. I was just going off of Emese's v3. (And this is partially
an artifact of basing off of v4.9-rc2... I'll refresh it to v4.10-rc2
once it's out.)

> and the whole patch against gcc-common.h would also conflict
> with the version i maintain and that you said you'd sync to so there's a decision
> to be made regarding how this will is to be maintained...

What's easiest for you? I'm okay to carry "unused by upstream yet"
functions and macros in gcc-common, though I don't like carrying lots
of commented out stuff. :P

-Kees

-- 
Kees Cook
Nexus Security
