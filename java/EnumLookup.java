import java.util.Arrays;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

public enum EnumLookup {

    FOO("foo"),
    BAR("bar"),
    BIZ("biz");
    private final String value;

    private static final Map<String, EnumLookup> LOOKUP_MAP = Arrays.stream(values())
            .collect(Collectors.toMap(EnumLookup::value, Function.identity()));

    EnumLookup(String value) {
        this.value = value;
    }

    public static EnumLookup getEnumFromValue(String value) {
        return LOOKUP_MAP.get(value);
    }

    public String value() {
        return this.value;
    }
}
