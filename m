Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from userp2120.oracle.com ([156.151.31.85]:57326 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbfKVPYI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Nov 2019 10:24:08 -0500
From: Nick Alcock <nick.alcock@oracle.com>
Subject: Re: [PATCH v3] kallsyms: add names of built-in modules
References: <20191119224225.2438-1-eugene.loh@oracle.com>
        <20191120045938.2155-1-eugene.loh@oracle.com>
        <CAK7LNASv4BkjHYaUXWEjeizHF6UckSef72y=X1VV2zEAOn1XdA@mail.gmail.com>
Date: Fri, 22 Nov 2019 15:23:01 +0000
In-Reply-To: <CAK7LNASv4BkjHYaUXWEjeizHF6UckSef72y=X1VV2zEAOn1XdA@mail.gmail.com>
        (Masahiro Yamada's message of "Fri, 22 Nov 2019 19:00:23 +0900")
Message-ID: <87tv6w9bqi.fsf@esperi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: eugene.loh@oracle.com, Steven Rostedt <rostedt@goodmis.org>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>, Jessica Yu <jeyu@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Marc Zyngier <maz@kernel.org>, Song Liu <songliubraving@fb.com>, Thomas Gleixner <tglx@linutronix.de>, "Keller, Jacob E" <jacob.e.keller@intel.com>, Kris Van Hees <kris.van.hees@oracle.com>, Nick Alcock <nick.alcock@oracle.com>

On 22 Nov 2019, Masahiro Yamada stated:

> On Wed, Nov 20, 2019 at 2:02 PM <eugene.loh@oracle.com> wrote:
>>
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> /proc/kallsyms is very useful for tracers and other tools that need
>> to map kernel symbols to addresses.
>>
>> It would be useful if there were a mapping between kernel symbol and
>> module name that only changed when the kernel source code is changed.
>
> Unfortunately, this is not necessarily true.
>
> Some objects could be linked into multiple modules.

Agreed, though this is fairly rare.

> CONFIG_LIQUIDIO=y && CONFIG_LIQUIDIO_VF=n  is OK
> CONFIG_LIQUIDIO=n && CONFIG_LIQUIDIO_VF=y  is OK
>
> The symbol-to-modname mapping changes depending on
> the .config though.

I don't see a way to avoid that: if you compile only one of the
constituent modules in, that module is now the only source of that
symbol: if you compile only the other one in, *it* is. It would be nice
if we could unambiguously find a way to identify a single module as the
source in this case, but it's not really possible, because you could
always choose to not compile one of the modules at all, and then it
would be unambiguously wrong to identify it as the source of the symbol.
So the mapping will always change if you do that.

The stability I was aiming for was in the common case: identifying
symbols as belonging to a module where those symbols are linked into
only that module, without regard to whether the module is built-in or
modular in this configuration.

I'd say we can progress to handling the nastier multiple-linkage case
incrementally, by starting from where this patch leaves us: it leaves us
in a better place to do so than we were in before it landed.

> It is hard to say which particular module the symbol came from.

Exactly.

> As far as I tested this patch, it seems it picked up a
> random one?

It'll get the one that's first by address, I think, which of course is
more or less random or at least we don't try to make it stable. I would
prefer if it picked up a constant one when a given set of modules are
competing for the same symbol, but doing that without making everything
much slower or more complex for a fairly obscure edge case is tricky.
(Also, I thought this was only a theoretical edge case: thanks for
highlighting some real instances of this!)

(If you can think of a way to do this which doesn't slow down the common
case of symbols only owned by one module, I would be very happy indeed.)

>>  scripts/kallsyms.c          | 515 +++++++++++++++++++++++++++++++++++-
>>  scripts/link-vmlinux.sh     |  17 ++
>>  scripts/namespace.pl        |   5 +
>>  8 files changed, 589 insertions(+), 23 deletions(-)
>
>
> This diff-stat is unfortunate.
> scripts/kallsyms.c increased 65% for parsing
> .tmp_vmlinux.ranges and modules_think.builtin
>
> I tend to suspect the design mistake...

When I wrote this patch, that was in a separate source file (and used by
other things that aren't upstream yet), but that was folded into
scripts/kallsyms.c for this submission. We can split it back out again
easily if you like.

> I tested this patch on x86_64_defconfig
> It also increases 24% of kallsyms data.
>
> The data increase is  outstanding compared with the
> amount of information added.

I would be very happy to find a more compact representation. Right now
this errs on the side of being similar to what kallsyms is already
doing. Fundamentally this is hard to encode compactly, though: range
tables (in either direction, symbol -> module or module -> set of
symbols) are more or less useless because the sybmols for a given module
are so scattered throughout the kernel's symbols. We could probably use
a smaller datatype than an int for kallsyms_symbol_modules in many
cases, I suppose, unless the kernel is truly huge: that would save some
space in the uncompressed output, though not in the vmlinuz. Any other
suggestions would be much appreciated.

>> diff --git a/Documentation/dontdiff b/Documentation/dontdiff
>> index 9f4392876099..32ee05f91410 100644
>> --- a/Documentation/dontdiff
>> +++ b/Documentation/dontdiff
>> @@ -180,6 +180,7 @@ modpost
>>  modules.builtin
>>  modules.builtin.modinfo
>>  modules.order
>> +modules_thick.builtin
>>  modversions.h*
>>  nconf
>>  nconf-cfg
>
> Most people missed to add this.
> I think you took time for internal review.

I grepped for 'modules.builtin' to make sure I caught all the places it
was used :)

>> +static struct obj2mod_elem *obj2mod[OBJ2MOD_N];
>> +
>> +static void obj2mod_init(void)
>> +{
>> +       memset(obj2mod, 0, sizeof(obj2mod));
>> +}
>
>
> Unneeded.
>
> The .bss section is automatically zero-cleared by
> operating system.  obj2mod is already zero-filled.

Agreed (with the caveat that I'm not the one shepherding this patch
through, but I hope Eugene agrees as well. :) )

>> +static void obj2mod_put(char *obj, int mod)
>
> you can add 'const' to the 'char *'.
>
> Same for obj2mod_get().

Agreed.

>> +static int addrmap_compare(const void *keyp, const void *rangep)
>> +{
>> +       unsigned long long addr = *((const unsigned long long *)keyp);
>> +       const struct addrmap_entry *range = (const struct addrmap_entry *)rangep;
>
> Cast is uneeded since rangep is an opaque pointer.

Overuse-of-C++ disease, sorry. (I can never remember whether it is C or
C++ that wants casts here, so I tend to err on the side of always
putting them in :) ).

>> +       /* skip the .init.scratch section */
>> +       if (strcmp(sym, "__init_scratch_end") == 0) {
>> +               init_scratch = 0;
>> +               goto read_another;
>> +       }
>> +       if (strcmp(sym, "__init_scratch_begin") == 0)
>> +               init_scratch = 1;
>> +       if (init_scratch)
>> +               goto read_another;
>
>
> How is this hunk related?
> I do not understand it from the commit log.

Ah, sorry, this was a recent addition to work around problems in the
parsing side in userspace: it really doesn't belong here, I suspect.

(Our userspace-side parsing code (which was getting confused about the
relatively recently-added presence of symbols that were neither 'all
address in order, modules jumbled together' nor 'addresses not in order,
one module at a time'. I suspect we should adjust to that instead -- but
I didn't make that change so I'm not really an authoritative source
here. Eugene?)

> The address range check is done in symbol_valid().
> I do not like to see different people adopt
> different ways.

Agreed.

>>         /* Ignore most absolute/undefined (?) symbols. */
>>         if (strcmp(sym, "_text") == 0)
>>                 _text = s->addr;
>> @@ -154,6 +291,14 @@ static int read_symbol(FILE *in, struct sym_entry *s)
>>         else if (!strncmp(sym, ".LASANPC", 8))
>>                 return -1;
>>
>> +       /* look up the builtin module this is part of (if any) */
>> +       range = (struct addrmap_entry *) bsearch(&s->addr,
>
> Unneeded cast because bsearch() returns an opaque pointer.

More C-is-not-C++ confusion on my part, mea culpa!

>> @@ -454,6 +601,19 @@ static void write_src(void)
>>         for (i = 0; i < 256; i++)
>>                 printf("\t.short\t%d\n", best_idx[i]);
>>         printf("\n");
>> +
>> +       output_label("kallsyms_modules");
>> +       for (i = 0; i < builtin_module_len; i++)
>> +               printf("\t.asciz\t\"%s\"\n", builtin_modules[i]);
>> +       printf("\n");
>
> Output strings in plain text?
>
> Did you consider the possibility for compression?

It's kinda hard, given that the table is accessed more or less at
random: any compression would need to be something that applied within
each module name, and there aren't *that* many module names. Bear in
mind that any given module name appears only once. I suspect the code to
do the decompression on the kernel side would be bigger than the space
savings.

This table isn't very big: the big one (and the incompressible one!) is
kallsyms_symbol_modules.

>> +       for (i = 0; i < builtin_module_len; i++)
>> +               free(builtin_modules[i]);
>> +
>> +       output_label("kallsyms_symbol_modules");
>> +       for (i = 0; i < table_cnt; i++)
>> +               printf("\t.int\t%d\n", table[i].module);

*This* is the one that optimization efforts should focus on. If anyone
can think of any. :)

>> +                       else if (strncmp(argv[i], "--builtin=", 10) == 0)
>> +                               modules_builtin = &argv[i][10];
>
> ".tmp_vmlinux.ranges" is hard-coded, but
> "modules_think.builtin" can be changed via option. Heh.

Code residue: at one point during development the kallmodsyms build
process was spinning over several versions of modules_thick.builtins and
unifying them. It doesn't do that any more, so I would be quite happy to
tear this thoroughly useless piece of customizability out. :)

>> +       # read the linker map to identify ranges of addresses:
>> +       #   - for each *.o file, report address, size, pathname
>> +       #       - most such lines will have four fields
>> +       #       - but sometimes there is a line break after the first field
>> +       #   - start reading at "Linker script and memory map"
>
> Searching for "Linker script and memory map" will probably bring
> portability issue.
>
> llvm folks will be unhappy with it.

We can easily search for something LLVM-suitable too. (But I suspect
we'd need an entirely different bit of awk for LLVM's map output
format.)

(I note that if this does differ much between LLVM and GCC, LLVM will be
incapable of building glibc's ld.so...)
